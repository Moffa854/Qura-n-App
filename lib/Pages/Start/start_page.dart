import 'package:flutter/material.dart';

import '../../Core/Constant/color_app.dart';
import '../../Core/Constant/sizes_app.dart';
import '../../Core/Widget/build_elevated_button.dart';
import '../../Core/Widget/create_slide_transation.dart';
import '../../Core/Widget/custom_top_text.dart';
import '../Auth/Sign In/Screens/sign_in_page.dart';
import 'widgets/custom_contaner_image.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: sizesApp(context, 80, 110, 150).toDouble(),
            child: const CustomTopText(
              subtext: 'Learn Quran every day and\nrecite once everyday',
              text: 'Quran App',
            ),
          ),
          Positioned(
            right: 20,
            left: 20,
            bottom: sizesApp(context, 150, 150, 80).toDouble(),
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomContanerImage(),
            ),
          ),
          Positioned(
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
          ),
        ],
      ),
    );
  }
}
