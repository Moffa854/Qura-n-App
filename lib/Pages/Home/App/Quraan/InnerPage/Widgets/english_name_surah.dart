import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../Data/Models/Quraan/main_quran_model.dart';

class EnglishNameSurah extends StatelessWidget {
  const EnglishNameSurah({
    super.key,
    required this.qur, 
  });

  final MainQuranModel qur;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          qur.name_translation,
          style: TextStyle(
            fontSize: sizesApp(context, 14, 17, 20).toDouble(),
            fontFamily: 'Poppins Bold',
            color: ColorApp.purple,
          ),
        ),
        Text(
          qur.id.toString(),
          style: TextStyle(
            fontSize: sizesApp(context, 11, 14, 17).toDouble(),
            fontFamily: 'Poppins Medium',
            color: ColorApp.purple,
          ),
        ),
        Text(
          qur.name_en,
          style: TextStyle(
            fontSize: sizesApp(context, 11, 14, 17).toDouble(),
            fontFamily: 'Poppins Medium',
            color: ColorApp.purple,
          ),
        ),
      ],
    );
  }
}
