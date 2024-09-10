import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';

class TextZikr extends StatelessWidget {
  const TextZikr({
    super.key,
    required this.con,
  });

  final ArrayeContent con;

  @override
  Widget build(BuildContext context) {
    return Text(
      con.text,
      style: TextStyle(
        fontSize:
            sizesApp(context, 24, 27, 30).toDouble(),
        fontFamily: 'Lateef Regular',
        color: ColorApp.purple,
      ),
    );
  }
}