import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Data/Models/Quraan/main_quran_model.dart';
import '../../../../../../cubit/QuraanCubit/quraan_cubit.dart';
import 'row_names_surah.dart';

class ListOfSurah extends StatelessWidget {
  const ListOfSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuraanCubit, QuraanState>(
      builder: (context, state) {
        if (state is QuraanLoaded) {
          List<MainQuranModel> quranList = state.quranList;
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final qur = quranList[index];
                return RowNamesSurah(qur: qur);
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Opacity(
                    opacity: 0.5,
                    child: Divider(
                      color: ColorApp.heavyPink,
                    ),
                  ),
                );
              },
              itemCount: quranList.length);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
