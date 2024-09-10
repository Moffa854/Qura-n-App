import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/color_app.dart';
import 'icons_arrow_back.dart';

class AppbarAyah extends StatelessWidget {
  final String titleBar;
  final VoidCallback? onpressedicon;
  const AppbarAyah({
    super.key,
    required this.titleBar,
    required this.onpressedicon,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconsArrowBack(onpressedicon: onpressedicon),
      centerTitle: true,
      title: Text(
        titleBar,
        style: const TextStyle(
          color: ColorApp.purple,
          fontSize: 24,
          fontFamily: 'Poppins Bold',
        ),
      ),
    );
  }
}
