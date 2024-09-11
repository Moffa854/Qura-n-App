import 'package:flutter/material.dart';

import '../../../../Core/Constant/color_app.dart';
import '../../../../Core/Constant/sizes_app.dart';

class BuildOrText extends StatelessWidget {
  const BuildOrText({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Or',
      style: TextStyle(
        fontSize: sizesApp(context, 13, 15, 17).toDouble(),
        color: ColorApp.purple,
        fontFamily: 'Poppins Regular',
      ),
    );
  }
}