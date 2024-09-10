import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';

class TextCount extends StatelessWidget {
  const TextCount({
    super.key,
    required this.con,
  });

  final ArrayeContent con;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: ColorApp.whitePink,
      label: Text(
        'عدد المرات: ${con.count.toString()}',
        style: const TextStyle(
            color: ColorApp.purple,
            fontSize: 20,
            fontFamily: 'Lateef Regular'),
      ),
    );
  }
}