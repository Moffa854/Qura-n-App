import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class TextTahiaa extends StatelessWidget {
  const TextTahiaa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Asalamu Alaikum !!!',
      style: TextStyle(
        color: ColorApp.heavyPink,
        fontSize: sizesApp(context, 13, 16, 20).toDouble(),
        fontFamily: 'Poppins Bold',
      ),
    );
  }
}