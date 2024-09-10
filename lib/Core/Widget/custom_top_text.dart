import 'package:flutter/material.dart';

import '../Constant/color_app.dart';
import '../Constant/sizes_app.dart';


class CustomTopText extends StatelessWidget {
  final String text;
  final String subtext;
  const CustomTopText({
    super.key,
    required this.text,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: ColorApp.purple,
            fontSize: sizesApp(context, 25, 30, 35).toDouble(),
            fontFamily: 'Poppins Bold',
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          subtext,
          style: TextStyle(
            color: ColorApp.heavyPink,
            fontSize: sizesApp(context, 13, 16, 20).toDouble(),
            fontFamily: 'Poppins Bold',
          ),
        ),
      ],
    );
  }
}
