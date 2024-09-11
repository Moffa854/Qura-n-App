import 'package:flutter/material.dart';

import '../../../../Core/Constant/sizes_app.dart';
import '../../../../Core/Widget/custom_top_text.dart';

class BuildTopText extends StatelessWidget {
  const BuildTopText({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: sizesApp(context, 80, 110, 150).toDouble(),
      child: const CustomTopText(
        subtext: 'Asalamu Alaikum !!!',
        text: 'Quran App',
      ),
    );
  }
}