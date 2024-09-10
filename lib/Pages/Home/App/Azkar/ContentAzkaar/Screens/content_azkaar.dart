import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/list_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';
import '../Widgets/appbar_content.dart';
import '../Widgets/list_view_content_azkaar.dart';

// ignore: must_be_immutable
class ContentAzkaar extends StatelessWidget {
  final num id;
  List<String> audioFiles = ListApp.audioAzkaar;

  final String title;
  final List<ArrayeContent> array;

  ContentAzkaar({
    super.key,
    required this.title,
    required this.array,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppbarContent(title: title, id: id, audioFiles: audioFiles),
          SliverToBoxAdapter(
            child: ListViewContentAzkaar(array: array),
          ),
        ],
      ),
    );
  }
}
