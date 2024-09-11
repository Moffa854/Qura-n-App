import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../cubit/Audio/audio_quraan_cubit.dart';
import '../../../../../../cubit/Bool/boolvisibility_cubit.dart';

class IconListenAzkaar extends StatelessWidget {
  const IconListenAzkaar({
    super.key,
    required this.id,
    required this.audioFiles,
  });

  final num id;
  final List<String> audioFiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: BlocBuilder<AudioCubit, AudioState>(
        builder: (context, audioState) {
          if (audioState == AudioState.loading) {
            return const CircularProgressIndicator();
          }
        
          return IconButton(
            onPressed: () {
              context.read<BoolvisibilityCubit>().taggel();
              int audioIndex = (id - 1).toInt();
              if (audioIndex >= 0 && audioIndex < audioFiles.length) {
                context
                    .read<AudioCubit>()
                    .toggleAudio(audioFiles[audioIndex]);
              } else {
                print("Error: Invalid index for audioFiles.");
              }
            },
            icon: audioState == AudioState.playing
                ? const Icon(
                    Icons.pause,
                    color: ColorApp.purple,
                    size: 30,
                  )
                : const Icon(
                    Icons.play_arrow,
                    color: ColorApp.purple,
                    size: 30,
                  ),
          );
        },
      ),
    );
  }
}