import 'package:flutter/material.dart';

import '../../../../Core/Constant/color_app.dart';
import '../../../../Core/Constant/sizes_app.dart';

class BuildSignUpTitle2 extends StatelessWidget {
  const BuildSignUpTitle2({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: sizesApp(context, 200, 300, 400).toDouble(),
      left: sizesApp(context, 15, 30, 35).toDouble(),
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontSize: sizesApp(context, 14, 16, 18).toDouble(),
          fontFamily: 'Poppins Bold',
          color: ColorApp.heavyPink,
        ),
      ),
    );
  }
}