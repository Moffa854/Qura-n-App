import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class TiltleAppbar extends StatelessWidget {
  const TiltleAppbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: sizesApp(context, 24, 27, 30).toDouble(),
        fontFamily: 'Lateef Regular',
        color: ColorApp.purple,
      ),
    );
  }
}