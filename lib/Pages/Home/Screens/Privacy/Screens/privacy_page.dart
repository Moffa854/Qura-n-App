import 'package:flutter/material.dart';

import '../Widgets/build_privacy_content.dart';
import '../Widgets/build_sliver_app_bar3.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar3(context: context),
          BuildPrivacyContent(context: context),
        ],
      ),
    );
  }
}
