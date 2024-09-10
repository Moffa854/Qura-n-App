import 'package:flutter/material.dart';

import '../Constant/sizes_app.dart';


class BuildElevatedButton extends StatelessWidget {
  final double phoneWidth;
  final double tabletWidth;
  final double desktopWidth;
  final double phonehight;
  final double tablethight;
  final double desktophight;
  final double borderRadios;
  final double fontSPhone;
  final double fontSTablet;
  final double fontSDesktop;
  final Color backgroundColor;
  final Color colorText;
  final VoidCallback onPressed;
  final String text;
  final String fontFamily;

  const BuildElevatedButton({
    super.key,
    required this.phoneWidth,
    required this.tabletWidth,
    required this.desktopWidth,
    required this.phonehight,
    required this.tablethight,
    required this.desktophight,
    required this.borderRadios,
    required this.backgroundColor,
    required this.colorText,
    required this.onPressed,
    required this.text,
    required this.fontFamily, required this.fontSPhone, required this.fontSTablet, required this.fontSDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          sizesApp(context, phoneWidth, tabletWidth, desktopWidth).toDouble(),
          sizesApp(context, phonehight, tablethight, desktophight).toDouble(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadios),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: colorText,
          fontFamily: fontFamily,
          fontSize: sizesApp(context, fontSPhone, fontSTablet, fontSDesktop).toDouble(),
        ),
      ),
    );
  }
}
