import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/list_app.dart';
import '../../../../../../Data/Models/Quraan/main_quran_model.dart';
import '../Widgets/appbar_ayah.dart';
import '../Widgets/body_ayah_page.dart';

class AyahPage extends StatelessWidget {
  final List<String> audioFiles = ListApp.audioQuraan;
  final String nameTranslation;
  final num id;
  final String nameEn;
  final List<ArreyContent> array;

  AyahPage({
    super.key,
    required this.nameTranslation,
    required this.id,
    required this.nameEn,
    required this.array,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppbarAyah(
            onpressedicon: () {
              Navigator.of(context).pop();
            },
            titleBar: 'Quran',
          ),
          ///////////////
          BodyAyahPage(
              nameTranslation: nameTranslation,
              id: id,
              nameEn: nameEn,
              audioFiles: audioFiles,
              array: array)
        ],
      ),
    );
  }
}
