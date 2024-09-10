import 'package:flutter/material.dart';


import '../../../../../../Data/Models/Quraan/main_quran_model.dart';
import 'info_name_surah_row.dart';
import 'list_ayat_quran.dart';

class BodyAyahPage extends StatelessWidget {
  const BodyAyahPage({
    super.key,
    required this.nameTranslation,
    required this.id,
    required this.nameEn,
    required this.audioFiles,
    required this.array,
  });

  final String nameTranslation;
  final num id;
  final String nameEn;
  final List<String> audioFiles;
  final List<ArreyContent> array;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          InfoNameSurahRow(
              nameTranslation: nameTranslation,
              id: id,
              nameEn: nameEn,
              audioFiles: audioFiles),
          ///////////////////////////
          ListAyatQuran(array: array, id: id)
        ],
      ),
    );
  }
}