import 'package:flutter/material.dart';

import '../../../../../Core/Constant/color_app.dart';
import '../../../../../Core/Constant/sizes_app.dart';

class BuildText extends StatelessWidget {
  const BuildText({
    super.key,
    required this.context,
    required this.text,
  });

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: sizesApp(context, 11, 14, 17).toDouble(),
        fontFamily: 'Poppins Medium',
        color: ColorApp.purple,
      ),
    );
  }
}
