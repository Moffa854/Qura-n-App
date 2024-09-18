import 'package:flutter/material.dart';

import '../Widgets/build_content.dart';
import '../Widgets/build_sliver_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar(context: context),
          BuildContent(context: context),
        ],
      ),
    );
  }
}
