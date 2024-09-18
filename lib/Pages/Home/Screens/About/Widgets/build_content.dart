import 'package:flutter/material.dart';

import 'build_sized_box.dart';
import 'build_text.dart';

class BuildContent extends StatelessWidget {
  const BuildContent({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BuildText(
                context: context,
                text:
                    'Welcome to Quran App, your number one\n source for all good things. We are dedicated\n to providing you\n the best of agirah, with a focus on agirah.'),
            BuildSizedBox(context: context),
            BuildText(
                context: context,
                text:
                    'We are working to turn our mission towards\n agirah. We hope you get the\n good information as much as we gather\n offering them to you.'),
            BuildSizedBox(context: context),
            BuildText(context: context, text: 'Sincerely,'),
            BuildSizedBox(context: context),
            BuildText(
                context: context, text: 'Mohamed Ibrahim J\n Mustafa Moffa I'),
          ],
        ),
      ),
    );
  }
}
