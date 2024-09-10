import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../Data/Models/Quraan/main_quran_model.dart';

class ArabicNameSurah extends StatelessWidget {
  const ArabicNameSurah({
    super.key,
    required this.qur,
  });

  final MainQuranModel qur;

  @override
  Widget build(BuildContext context) {
    return Text(
      qur.name,
      style: TextStyle(
        fontSize: sizesApp(context, 24, 27, 30).toDouble(),
        fontFamily: 'Lateef Regular',
        color: ColorApp.purple,
      ),
    );
  }
}