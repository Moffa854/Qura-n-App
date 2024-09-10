import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Data/Models/Azkaar/main_azkaar_model.dart';
import '../../../../../../cubit/AzkaarCubit/azkaar_cubit.dart';
import 'child_list_view.dart';

class LIstViewAzkaarName extends StatelessWidget {
  const LIstViewAzkaarName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkaarCubit, AzkaarState>(
      builder: (context, state) {
        if (state is AzkaarLoaded) {
          final List<MainAzkaarModel> listAzkaar = state.azkaarList;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final azk = listAzkaar[index];
                  return ChildListView(azk: azk);
                },
                separatorBuilder: (context, index) => Divider(
                      color: ColorApp.whitePink.withOpacity(0.5),
                    ),
                itemCount: listAzkaar.length),
          );
        } else {
          return const CircularProgressIndicator(
            color: ColorApp.purple,
          );
        }
      },
    );
  }
}
