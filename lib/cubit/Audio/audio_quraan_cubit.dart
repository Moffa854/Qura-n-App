import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? currentAudio;

  AudioCubit() : super(AudioState.stopped) {
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.playing) {
        emit(AudioState.playing);
      } else if (playerState.processingState == ProcessingState.loading ||
          playerState.processingState == ProcessingState.buffering) {
        emit(AudioState.loading);
      } else {
        emit(AudioState.stopped);
      }
    });

    _audioPlayer.positionStream.listen((position) {
      if (position >= (_audioPlayer.duration ?? Duration.zero)) {
        emit(AudioState.stopped);
      }
    });
  }

  Future<void> toggleAudio(String audioPath) async {
    if (currentAudio == audioPath && state == AudioState.playing) {
      await _audioPlayer.stop();
      emit(AudioState.stopped);
    } else {
      await _audioPlayer.stop();
      emit(AudioState.loading);

      currentAudio = audioPath;
      try {
        final String downloadUrl =
            await FirebaseStorage.instance.ref(audioPath).getDownloadURL();
        await _audioPlayer.setUrl(downloadUrl);
        await _audioPlayer.play();
        await _audioPlayer.stop();
      } catch (e) {
        emit(AudioState.error);
        print("Error loading audio: $e");
      }
    }
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
    emit(AudioState.stopped);
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}

enum AudioState { stopped, loading, playing, error }
