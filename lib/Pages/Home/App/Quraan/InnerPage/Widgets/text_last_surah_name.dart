import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../cubit/Last Read/last_read_cubit.dart';

class TextLastSurahName extends StatelessWidget {
  const TextLastSurahName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastReadCubit, String?>(
      builder: (context, state) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Text(
            state ?? '',
            style: TextStyle(
              fontSize: sizesApp(context, 13, 16, 19).toDouble(),
              color: ColorApp.purple,
              fontFamily: 'Poppins Bold',
            ),
          ),
        );
      },
    );
  }
}