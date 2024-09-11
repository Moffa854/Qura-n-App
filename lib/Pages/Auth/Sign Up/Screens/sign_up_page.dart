import 'package:flutter/material.dart';

import '../Widgets/build_mosque_image.dart';
import '../Widgets/build_sign_up_form.dart';
import '../Widgets/build_sign_up_title.dart';
import '../Widgets/build_top_text.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BuildTopText2(context: context),
          BuildMosqueImage2(context: context),
          BuildSignUpTitle2(context: context),
          BuildSignUpForm2(
              formKey: formKey,
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              context: context),
        ],
      ),
    );
  }
}
