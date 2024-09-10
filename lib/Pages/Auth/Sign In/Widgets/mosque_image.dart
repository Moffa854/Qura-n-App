import 'package:flutter/material.dart';

import '../../../../Core/Constant/images_app.dart';
import '../../../../Core/Constant/sizes_app.dart';

class MosqueImage extends StatelessWidget {
  const MosqueImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Image.asset(
        fit: BoxFit.contain,
        ImagesApp.mosqueopacity,
        width: sizesApp(context, 450, 800, 1000).toDouble(),
        height: sizesApp(context, 450, 800, 1000).toDouble(),
      ),
    );
  }
}
