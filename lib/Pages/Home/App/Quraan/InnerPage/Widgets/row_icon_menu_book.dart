import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class RowIconMenuBook extends StatelessWidget {
  const RowIconMenuBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.menu_book,
          color: ColorApp.purple,
          size: 25,
        ),
        SizedBox(
          width: sizesApp(context, 13, 16, 19).toDouble(),
        ),
        Text(
          'Last Read',
          style: TextStyle(
            fontSize: sizesApp(context, 13, 16, 19).toDouble(),
            color: ColorApp.purple,
            fontFamily: 'Poppins Medium',
          ),
        )
      ],
    );
  }
}