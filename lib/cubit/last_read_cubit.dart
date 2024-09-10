
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class LastReadCubit extends Cubit<String?> {
  LastReadCubit() : super(null) {
    loadLastReadSurah();
  }

  void saveLastReadSurah(String surahName) async {
    final box = await Hive.openBox('quranBox');
    await box.put('lastReadSurah', surahName);
    emit(surahName);
  }

  void loadLastReadSurah() async {
    final box = await Hive.openBox('quranBox');
    final lastReadSurah = box.get('lastReadSurah');
    emit(lastReadSurah);
  }
}
