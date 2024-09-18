import 'package:flutter/material.dart';

class BuildSizedBox extends StatelessWidget {
  const BuildSizedBox({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 40,
    );
  }
}
