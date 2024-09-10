import 'package:flutter/material.dart';

import 'package:quraan_app1/Pages/Home/App/Azkar/AzkaarPage/Widgets/stack_muslim_image.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';

class ChildLIstTile extends StatelessWidget {
  const ChildLIstTile({
    super.key,
    required this.azk,
  });

  final MainAzkaarModel azk;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: StackMuslimImage(azk: azk),
      trailing: const Icon(
        Icons.arrow_right_alt_rounded,
        color: ColorApp.purple,
        size: 25,
      ),
      title: Text(
        azk.category,
        style: TextStyle(
          color: ColorApp.purple,
          fontFamily: 'Lateef Regular',
          fontSize: sizesApp(context, 24, 27, 30).toDouble(),
        ),
      ),
    );
  }
}
