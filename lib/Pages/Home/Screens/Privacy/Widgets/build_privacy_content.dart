import 'package:flutter/material.dart';

import 'build_privacy_text.dart';

class BuildPrivacyContent extends StatelessWidget {
  const BuildPrivacyContent({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BuildPrivacyText(context: context),
      ),
    );
  }
}
