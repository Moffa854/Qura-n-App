import 'package:flutter/material.dart';

import 'icon_arrow_back_content.dart';
import 'icon_listen_azkaar.dart';
import 'tiltle_appbar.dart';


class AppbarContent extends StatelessWidget {
  const AppbarContent({
    super.key,
    required this.title,
    required this.id,
    required this.audioFiles,
  });

  final String title;
  final num id;
  final List<String> audioFiles;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: TiltleAppbar(title: title),
      centerTitle: true,
      leading: const IconArrowBackContent(),
      actions: [IconListenAzkaar(id: id, audioFiles: audioFiles)],
    );
  }
}
