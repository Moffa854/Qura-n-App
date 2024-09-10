import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class TextSurah extends StatelessWidget {
  const TextSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Surah',
      style: TextStyle(
        fontSize: sizesApp(context, 13, 16, 19).toDouble(),
        color: ColorApp.purple,
        fontFamily: 'Poppins Medium',
      ),
    );
  }
}
