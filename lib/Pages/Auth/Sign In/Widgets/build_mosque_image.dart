import 'package:flutter/material.dart';
import 'package:quraan_app1/Core/Constant/sizes_app.dart';

import 'mosque_image.dart';

class BuildMosqueImage extends StatelessWidget {
  const BuildMosqueImage({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: sizesApp(context, 0, 0, 0).toDouble(),
      child: const MosqueImage(),
    );
  }
}