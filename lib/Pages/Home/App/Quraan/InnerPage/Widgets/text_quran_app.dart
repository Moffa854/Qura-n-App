import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class TextQuranApp extends StatelessWidget {
  const TextQuranApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Quran App',
      style: TextStyle(
        fontSize: sizesApp(context, 22, 26, 28).toDouble(),
        fontFamily: 'Poppins Bold',
        color: ColorApp.purple,
      ),
    );
  }
}