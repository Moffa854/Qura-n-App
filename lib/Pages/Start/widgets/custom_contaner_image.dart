import 'package:flutter/material.dart';

import '../../../Core/Constant/color_app.dart';
import '../../../Core/Constant/images_app.dart';
import '../../../Core/Constant/sizes_app.dart';


class CustomContanerImage extends StatelessWidget {
  const CustomContanerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: sizesApp(context, 50, 150, 150).toDouble(),
          right: sizesApp(context, 20, 60, 60).toDouble(),
          left: sizesApp(context, 20, 60, 60).toDouble()),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: sizesApp(context, 450, 800, 900).toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            sizesApp(context, 30, 55, 90).toDouble(),
          ),
          color: ColorApp.purple,
        ),
        child: Image.asset(
          ImagesApp.mosque,
        ),
      ),
    );
  }
}
