import 'package:flutter/material.dart';
import 'package:quraan_app1/Core/Constant/color_app.dart';

import '../../../../../Core/Constant/sizes_app.dart';

class BuildHelpText extends StatelessWidget {
  const BuildHelpText({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Text(
      'For further information about this app\nCONTACT: ibrahimrasith@gmail.com\nmustafamoffa@gmail.com',
      style: TextStyle(
        fontSize: sizesApp(context, 11, 14, 17).toDouble(),
        fontFamily: 'Poppins Medium',
        color: ColorApp.purple,
      ),
    );
  }
}