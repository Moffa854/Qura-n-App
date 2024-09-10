import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';

class IconButtonDrawer extends StatelessWidget {
  const IconButtonDrawer({
    super.key,
    required this.scafoldKey,
  });

  final GlobalKey<ScaffoldState>? scafoldKey;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          scafoldKey?.currentState?.openDrawer();
        },
        icon: const Icon(
          Icons.sort,
          color: ColorApp.purple,
          size: 35,
        ),
      );
    });
  }
}