import 'package:flutter/material.dart';

import '../../../../../../Data/Models/Quraan/main_quran_model.dart';
import 'arabic_name_surah.dart';
import 'english_name_surah.dart';

class EnglishArabicNameSurah extends StatelessWidget {
  const EnglishArabicNameSurah({
    super.key,
    required this.qur,
  });

  final MainQuranModel qur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EnglishNameSurah(qur: qur),
        /////////////
        ArabicNameSurah(qur: qur),
      ],
    );
  }
}
