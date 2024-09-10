import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class ContainerSearchAzkaar extends StatelessWidget {
  const ContainerSearchAzkaar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: sizesApp(context, 135, 200, 300).toDouble(),
        height: sizesApp(context, 30, 40, 300).toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: ColorApp.whitePink,
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.search,
              color: ColorApp.purple,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
