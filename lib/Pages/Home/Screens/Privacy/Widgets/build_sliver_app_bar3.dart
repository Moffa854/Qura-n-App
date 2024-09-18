import 'package:flutter/material.dart';

import '../../../../../Core/Constant/color_app.dart';
import '../../../../../Core/Constant/sizes_app.dart';

class BuildSliverAppBar3 extends StatelessWidget {
  const BuildSliverAppBar3({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: ColorApp.purple),
      title: Text(
        'Privacy & Security',
        style: TextStyle(
          fontSize: sizesApp(context, 24, 26, 28).toDouble(),
          fontFamily: 'Poppins Bold',
          color: ColorApp.purple,
        ),
      ),
    );
  }
}
