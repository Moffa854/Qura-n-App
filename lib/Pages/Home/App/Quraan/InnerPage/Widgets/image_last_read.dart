import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/images_app.dart';

class ImageLastRead extends StatelessWidget {
  const ImageLastRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Image.asset(
        ImagesApp.lastread,
        fit: BoxFit.contain,
      ),
    );
  }
}