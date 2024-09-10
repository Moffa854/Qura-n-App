import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';
import 'child_list_view.dart';

class ListViewContentAzkaar extends StatelessWidget {
  const ListViewContentAzkaar({
    super.key,
    required this.array,
  });

  final List<ArrayeContent> array;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final con = array[index];

            return ChildListView2(con: con);
          },
          separatorBuilder: (context, index) => const Divider(
                color: ColorApp.whitePink,
              ),
          itemCount: array.length),
    );
  }
}
