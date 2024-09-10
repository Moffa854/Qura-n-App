import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/sizes_app.dart';
import 'list_view_azkaar_name.dart';

class BodyAzkaar extends StatelessWidget {
  const BodyAzkaar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: EdgeInsets.only(
            left: sizesApp(context, 20, 30, 40).toDouble(),
            top: sizesApp(context, 20, 30, 40).toDouble(),
            right: sizesApp(context, 20, 30, 40).toDouble(),
          ),
          child: const LIstViewAzkaarName()),
    );
  }
}