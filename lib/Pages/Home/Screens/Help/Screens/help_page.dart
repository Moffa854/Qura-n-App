import 'package:flutter/material.dart';
import 'package:quraan_app1/Pages/Home/Screens/Help/Widgets/build_sliver_app_bar2.dart';

import '../Widgets/build_content2.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar2(context: context),
          BuildContent2(context: context),
        ],
      ),
    );
  }
}
