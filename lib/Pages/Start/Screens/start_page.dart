import 'package:flutter/material.dart';

import '../widgets/build_container_image.dart';
import '../widgets/build_get_started_button.dart';
import '../widgets/build_top_text.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BuildTopText(context: context),
          BuildContainerImage(context: context),
          BuildGetStartedButton(context: context),
        ],
      ),
    );
  }
}
