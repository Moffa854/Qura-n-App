import 'package:flutter/material.dart';

import '../../../../../Core/Constant/color_app.dart';

class BuildErrorMessage extends StatelessWidget {
  const BuildErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Failed to load prayer times',
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins Regular',
          color: ColorApp.purple,
        ),
      ),
    );
  }
}