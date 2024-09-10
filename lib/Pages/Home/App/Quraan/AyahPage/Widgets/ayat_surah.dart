import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../Data/Models/Quraan/main_quran_model.dart';

class AyatSurah extends StatelessWidget {
  const AyatSurah({
    super.key,
    required this.ayah,
  });

  final ArreyContent ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: ayah.ar,
              style: TextStyle(
                color: ColorApp.purple,
                fontSize: sizesApp(context, 24, 28, 30)
                    .toDouble(),
                fontFamily: 'Lateef Regular',
              ),
            ),
          ],
        ),
      ),
    ),
    Align(
      alignment: Alignment.centerRight,
      child: Text(
        ayah.en,
        style: TextStyle(
          color: ColorApp.gray,
          fontSize:
              sizesApp(context, 13, 13, 19).toDouble(),
          fontFamily: 'Poppins Regular',
        ),
      ),
    ),
      ],
    );
  }
}