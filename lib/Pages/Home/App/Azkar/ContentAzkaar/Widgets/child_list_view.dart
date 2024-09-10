import 'package:flutter/material.dart';


import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';
import 'stack_muslim_image_content.dart';
import 'text_count.dart';
import 'text_zikr.dart';

class ChildListView2 extends StatelessWidget {
  const ChildListView2({
    super.key,
    required this.con,
  });

  final ArrayeContent con;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          StackMuslimImageContent(con: con),
          TextZikr(con: con),
          TextCount(con: con),
        ],
      ),
    );
  }
}
