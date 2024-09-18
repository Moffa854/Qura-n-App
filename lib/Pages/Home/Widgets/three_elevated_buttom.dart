import 'package:flutter/material.dart';

import '../../../Core/Constant/color_app.dart';
import '../../../Core/Widget/build_elevated_button.dart';
import '../../../Core/Widget/create_slide_transation.dart';
import '../Screens/About/Screens/about_page.dart';
import '../Screens/Help/Screens/help_page.dart';
import '../Screens/Privacy/Screens/privacy_page.dart';

class ThreeElevatedButtom extends StatelessWidget {
  const ThreeElevatedButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildElevatedButton(
          phoneWidth: MediaQuery.of(context).size.width,
          tabletWidth: MediaQuery.of(context).size.width,
          desktopWidth: MediaQuery.of(context).size.width,
          phonehight: 60,
          tablethight: 75,
          desktophight: 90,
          borderRadios: 12,
          backgroundColor: Colors.white,
          colorText: ColorApp.purple,
          onPressed: () {
            Navigator.of(context).push(
              createSlideTransation(
                const PrivacyPage(),
                const Offset(1.0, 0.1),
              ),
            );
          },
          text: 'Privacy & Security',
          fontFamily: 'Poppins Medium',
          fontSPhone: 18,
          fontSTablet: 21,
          fontSDesktop: 24,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        BuildElevatedButton(
          phoneWidth: MediaQuery.of(context).size.width,
          tabletWidth: MediaQuery.of(context).size.width,
          desktopWidth: MediaQuery.of(context).size.width,
          phonehight: 60,
          tablethight: 75,
          desktophight: 90,
          borderRadios: 12,
          backgroundColor: Colors.white,
          colorText: ColorApp.purple,
          onPressed: () {
            Navigator.of(context).push(
              createSlideTransation(
                const HelpPage(),
                const Offset(1.0, 0.1),
              ),
            );
          },
          text: 'Help & Support',
          fontFamily: 'Poppins Medium',
          fontSPhone: 18,
          fontSTablet: 21,
          fontSDesktop: 24,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        BuildElevatedButton(
          phoneWidth: MediaQuery.of(context).size.width,
          tabletWidth: MediaQuery.of(context).size.width,
          desktopWidth: MediaQuery.of(context).size.width,
          phonehight: 60,
          tablethight: 75,
          desktophight: 90,
          borderRadios: 12,
          backgroundColor: Colors.white,
          colorText: ColorApp.purple,
          onPressed: () {
            Navigator.of(context).push(
              createSlideTransation(
                const AboutPage(),
                const Offset(1.0, 0.1),
              ),
            );
          },
          text: 'About',
          fontFamily: 'Poppins Medium',
          fontSPhone: 18,
          fontSTablet: 21,
          fontSDesktop: 24,
        ),
        const Spacer(),
      ],
    );
  }
}