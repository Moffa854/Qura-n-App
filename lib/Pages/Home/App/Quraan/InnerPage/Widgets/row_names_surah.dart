import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../Core/Widget/create_slide_transation.dart';
import '../../../../../../Data/Models/Quraan/main_quran_model.dart';
import '../../../../../../cubit/last_read_cubit.dart';
import '../../AyahPage/Screens/ayah_page.dart';
import 'english_arabic_name_surah.dart';

class RowNamesSurah extends StatelessWidget {
  const RowNamesSurah({
    super.key,
    required this.qur,
  });

  final MainQuranModel qur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizesApp(context, 30, 50, 70).toDouble(),
      ),
      child: GestureDetector(
        onTap: () {
          context.read<LastReadCubit>().saveLastReadSurah(
                qur.name_translation,
              );
          Navigator.of(context).push(
            createSlideTransation(
              AyahPage(
                array: qur.array,
                id: qur.id,
                nameEn: qur.name_en,
                nameTranslation: qur.name_translation,
              ),
              const Offset(1.0, 0.1),
            ),
          );
        },
        child: EnglishArabicNameSurah(qur: qur),
      ),
    );
  }
}
