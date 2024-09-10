import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class EnglishNameSurah2 extends StatelessWidget {
  const EnglishNameSurah2({
    super.key,
    required this.nameTranslation,
    required this.id,
    required this.nameEn,
  });

  final String nameTranslation;
  final num id;
  final String nameEn;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            nameTranslation,
            style: TextStyle(
              fontSize:
                  sizesApp(context, 14, 18, 20).toDouble(),
              fontFamily: 'Poppins Bold',
              color: ColorApp.purple,
            ),
          ),
          Text(
            id.toString(),
            style: TextStyle(
              fontSize:
                  sizesApp(context, 11, 14, 17).toDouble(),
              fontFamily: 'Poppins Medium',
              color: ColorApp.purple,
            ),
          ),
          Text(
            nameEn,
            style: TextStyle(
              fontSize:
                  sizesApp(context, 11, 14, 17).toDouble(),
              fontFamily: 'Poppins Medium',
              color: ColorApp.purple,
            ),
          ),
        ],
      ),
    );
  }
}