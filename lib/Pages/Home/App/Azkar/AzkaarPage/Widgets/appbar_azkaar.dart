import 'package:flutter/material.dart';
import 'package:quraan_app1/Pages/Home/App/Azkar/AzkaarPage/Widgets/container_search_azkaar.dart';


import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';

class AppbarAzkaar extends StatelessWidget {
  const AppbarAzkaar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      actions: const [ContainerSearchAzkaar()],
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Azkaar',
          style: TextStyle(
            fontSize: sizesApp(context, 24, 26, 28).toDouble(),
            fontFamily: 'Poppins Bold',
            color: ColorApp.purple,
          ),
        ),
      ),
    );
  }
}
