import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';


class IconsArrowBack extends StatelessWidget {
  const IconsArrowBack({
    super.key,
    required this.onpressedicon,
  });

  final VoidCallback? onpressedicon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressedicon,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorApp.purple,
        size: 30,
      ),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}