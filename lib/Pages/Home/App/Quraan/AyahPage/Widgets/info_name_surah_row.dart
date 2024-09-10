import 'package:flutter/material.dart';

import 'english_name_surah.dart';
import 'icon_listen_ayat.dart';


class InfoNameSurahRow extends StatelessWidget {
  const InfoNameSurahRow({
    super.key,
    required this.nameTranslation,
    required this.id,
    required this.nameEn,
    required this.audioFiles,
  });

  final String nameTranslation;
  final num id;
  final String nameEn;
  final List<String> audioFiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EnglishNameSurah2(
              nameTranslation: nameTranslation, id: id, nameEn: nameEn),
          IconListenAyat(id: id, audioFiles: audioFiles)
        ],
      ),
    );
  }
}
