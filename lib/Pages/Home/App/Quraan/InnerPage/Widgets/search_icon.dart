import 'package:flutter/material.dart';

import '../../../../../../Core/Constant/color_app.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 5),
        child: Icon(
          Icons.search,
          color: ColorApp.purple,
          size: 25,
        ),
      ),
    );
  }
}