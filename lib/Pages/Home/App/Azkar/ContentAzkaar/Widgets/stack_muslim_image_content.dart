import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../Core/Constant/svg_image_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';

class StackMuslimImageContent extends StatelessWidget {
  const StackMuslimImageContent({
    super.key,
    required this.con,
  });

  final ArrayeContent con;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          SvgImageApp.muslimf,
          color: ColorApp.purple,
          width: sizesApp(context, 33, 36, 39).toDouble(),
          height:
              sizesApp(context, 33, 36, 39).toDouble(),
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              con.id.toString(),
              style: TextStyle(
                  color: ColorApp.purple,
                  fontSize: sizesApp(context, 15, 18, 21)
                      .toDouble(),
                  fontFamily: 'Poppins Regular'),
            ),
          ),
        ),
      ],
    );
  }
}