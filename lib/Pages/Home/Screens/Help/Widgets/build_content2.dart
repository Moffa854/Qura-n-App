import 'package:flutter/material.dart';

import 'build_help_text.dart';

class BuildContent2 extends StatelessWidget {
  const BuildContent2({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BuildHelpText(context: context),
      ),
    );
  }
}
