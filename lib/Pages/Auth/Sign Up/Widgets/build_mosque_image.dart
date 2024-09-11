import 'package:flutter/material.dart';

import '../../../../Core/Constant/sizes_app.dart';
import '../../Sign In/Widgets/mosque_image.dart';

class BuildMosqueImage2 extends StatelessWidget {
  const BuildMosqueImage2({
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