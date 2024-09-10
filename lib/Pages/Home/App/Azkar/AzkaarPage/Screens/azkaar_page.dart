import 'package:flutter/material.dart';


import '../Widgets/appbar_azkaar.dart';
import '../Widgets/body_azkaar.dart';

class AzkaarPage extends StatelessWidget {
  const AzkaarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [AppbarAzkaar(), BodyAzkaar()],
      ),
    );
  }
}
