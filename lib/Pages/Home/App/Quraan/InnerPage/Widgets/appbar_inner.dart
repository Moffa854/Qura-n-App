import 'package:flutter/material.dart';

import 'container_search.dart';
import 'icon_button_drawer.dart';
import 'text_quran_app.dart';


class AppBarInner extends StatelessWidget {
  const AppBarInner({
    super.key,
    required this.scafoldKey,
  });

  final GlobalKey<ScaffoldState>? scafoldKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButtonDrawer(scafoldKey: scafoldKey),
      actions: const [ContainerSearch()],
      centerTitle: true,
      title: const TextQuranApp(),
    );
  }
}