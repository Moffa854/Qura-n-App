import 'package:flutter/material.dart';

import '../../../Core/Constant/color_app.dart';
import '../../../Core/Constant/sizes_app.dart';
import '../../../Core/Widget/build_elevated_button.dart';
import '../../../Core/Widget/create_slide_transation.dart';
import '../../Auth/Sign In/Screens/sign_in_page.dart';

class BuildGetStartedButton extends StatelessWidget {
  const BuildGetStartedButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: sizesApp(context, 120, 120, 150).toDouble(),
      child: BuildElevatedButton(
        fontSPhone: 18,
        fontSDesktop: 18,
        fontSTablet: 18,
        backgroundColor: ColorApp.heavyPink,
        borderRadios: 50,
        colorText: Colors.white,
        desktopWidth: 350,
        desktophight: 80,
        fontFamily: 'Poppins SemiBold',
        onPressed: () {
          Navigator.of(context).push(
      createSlideTransation(
         SignInPage(),
        const Offset(1.0, 0.0),
      ),
    );
        },
        phoneWidth: 250,
        phonehight: 60,
        tabletWidth: 300,
        tablethight: 70,
        text: 'Get started',
      ),
    );
  }
}