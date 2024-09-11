import 'package:flutter/material.dart';

import '../../../../../Core/Constant/color_app.dart';

class BuildLoadingIndicator extends StatelessWidget {
  const BuildLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: ColorApp.purple),
          SizedBox(height: 10),
          Text(
            'جاري تحميل مواقيت الصلاة...',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins Regular',
              color: ColorApp.purple,
            ),
          ),
        ],
      ),
    );
  }
}