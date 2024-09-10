import 'package:flutter/material.dart';

import 'text_name_user.dart';
import 'text_tahiaa.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTahiaa(),
        TextNameUser(),
      ],
    );
  }
}