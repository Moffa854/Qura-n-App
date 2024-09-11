import 'package:flutter/material.dart';

import '../../../Core/Constant/sizes_app.dart';
import 'custom_contaner_image.dart';

class BuildContainerImage extends StatelessWidget {
  const BuildContainerImage({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      left: 20,
      bottom: sizesApp(context, 150, 150, 80).toDouble(),
      child: const Padding(
        padding: EdgeInsets.only(top: 30),
        child: CustomContanerImage(),
      ),
    );
  }
}