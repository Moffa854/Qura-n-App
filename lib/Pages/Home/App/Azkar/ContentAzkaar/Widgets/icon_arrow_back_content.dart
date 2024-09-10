import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';

class IconArrowBackContent extends StatelessWidget {
  const IconArrowBackContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
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