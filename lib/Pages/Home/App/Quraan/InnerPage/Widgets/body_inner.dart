import 'package:flutter/material.dart';


import '../../../../../../Core/Constant/sizes_app.dart';
import 'contaner_last_read.dart';
import 'list_of_surah.dart';
import 'welcome_text.dart';

class BodyInner extends StatelessWidget {
  const BodyInner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
            left: sizesApp(context, 20, 30, 40).toDouble(),
            top: sizesApp(context, 20, 30, 40).toDouble(),
            right: sizesApp(context, 20, 30, 40).toDouble(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeText(),
              ////////////////
              SizedBox(
                height: sizesApp(context, 10, 30, 20).toDouble(),
              ),
              const ContanerLastRead(),
              /////////////////
              SizedBox(
                height: sizesApp(context, 20, 50, 70).toDouble(),
              ),
              const ListOfSurah(),
            ],
          ),
        ),
      ),
    );
  }
}