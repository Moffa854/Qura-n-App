import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/svg_image_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';

class StackMuslimImage extends StatelessWidget {
  const StackMuslimImage({
    super.key,
    required this.azk,
  });

  final MainAzkaarModel azk;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          SvgImageApp.muslimf,
          color: ColorApp.purple,
          width: 40,
          height: 40,
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              azk.id.toString(),
              style: const TextStyle(
                  color: ColorApp.purple,
                  fontSize: 15,
                  fontFamily: 'Poppins Regular'),
            ),
          ),
        )
      ],
    );
  }
}