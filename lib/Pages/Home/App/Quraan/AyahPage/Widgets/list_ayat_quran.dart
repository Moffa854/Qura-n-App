import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Data/Models/Quraan/main_quran_model.dart';
import 'ayat_surah.dart';

class ListAyatQuran extends StatelessWidget {
  const ListAyatQuran({
    super.key,
    required this.array,
    required this.id,
  });

  final List<ArreyContent> array;
  final num id;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: array.length,
        itemBuilder: (context, index) {
          final ayah = array[index];
          return Padding(
            padding: const EdgeInsets.only(right: 25, bottom: 15, left: 5),
            child: Column(
              children: [
                if (id != 9 && id != 1 && index == 0)
                  const Text(
                    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ',
                    style: TextStyle(
                      color: ColorApp.purple,
                      fontFamily: 'Lateef Regular',
                      fontSize: 30,
                    ),
                  ),
                AyatSurah(ayah: ayah)
              ],
            ),
          );
        },
      ),
    );
  }
}
