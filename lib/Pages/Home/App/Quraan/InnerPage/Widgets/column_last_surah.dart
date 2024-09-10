import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/sizes_app.dart';
import 'row_icon_menu_book.dart';
import 'text_last_surah_name.dart';
import 'text_surah.dart';

class ColumnLastSurah extends StatelessWidget {
  const ColumnLastSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: sizesApp(context, 13, 16, 19).toDouble(),
            left: sizesApp(context, 15, 18, 21).toDouble(),
          ),
          child: const RowIconMenuBook(),
        ),
        SizedBox(
          height: sizesApp(context, 15, 30, 25).toDouble(),
        ),
        const TextSurah(),
        SizedBox(
          height: sizesApp(context, 15, 15, 25).toDouble(),
        ),
        const TextLastSurahName(),
      ],
    );
  }
}
