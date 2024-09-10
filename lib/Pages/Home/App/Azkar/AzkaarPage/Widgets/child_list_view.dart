import 'package:flutter/material.dart';


import '../../../../../../Core/Widget/create_slide_transation.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';
import '../../ContentAzkaar/Screens/content_azkaar.dart';
import 'child_list_tile.dart';

class ChildListView extends StatelessWidget {
  const ChildListView({
    super.key,
    required this.azk,
  });

  final MainAzkaarModel azk;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          createSlideTransation(
            ContentAzkaar(id: azk.id, title: azk.category, array: azk.arraye),
            const Offset(
              1.0,
              0.1,
            ),
          ),
        );
      },
      child: ChildLIstTile(azk: azk),
    );
  }
}
