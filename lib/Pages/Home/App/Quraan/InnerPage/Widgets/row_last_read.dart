import 'package:flutter/material.dart';

import 'column_last_surah.dart';
import 'image_last_read.dart';

class RowLastRead extends StatelessWidget {
  const RowLastRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ColumnLastSurah(), ImageLastRead()],
    );
  }
}
