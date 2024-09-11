import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import 'search_icon.dart';

class BuildSearchContainer extends StatelessWidget {
  const BuildSearchContainer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizesApp(context, 135, 200, 300).toDouble(),
      height: sizesApp(context, 30, 40, 300).toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: ColorApp.whitePink,
      ),
      child: const SearchIcon(),
    );
  }
}