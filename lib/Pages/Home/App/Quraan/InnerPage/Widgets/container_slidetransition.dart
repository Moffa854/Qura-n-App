import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import 'row_last_read.dart';

class ContainerSlideTransition extends StatelessWidget {
  const ContainerSlideTransition({
    super.key,
    required Animation<Offset> offsetAnimation,
  }) : _offsetAnimation = offsetAnimation;

  final Animation<Offset> _offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: sizesApp(context, 150, 270, 300).toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            sizesApp(context, 25, 40, 300).toDouble(),
          ),
          color: ColorApp.whitePink,
        ),
        child: const RowLastRead(),
      ),
    );
  }
}