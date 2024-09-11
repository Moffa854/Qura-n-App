import 'package:flutter/material.dart';

import '../../../../Core/Constant/sizes_app.dart';
import '../../../Start/widgets/build_top_text.dart';
import '../Widgets/build_mosque_image.dart';
import '../Widgets/build_or_text.dart';
import '../Widgets/build_signIn_title.dart';
import '../Widgets/rich_text_register.dart';
import '../Widgets/sign_in_buttom.dart';
import '../Widgets/social_sign_in.dart';
import '../Widgets/three_text_form_field.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BuildTopText(context: context),
          BuildMosqueImage(context: context),
          BuildSignInTitle(context: context),
          buildSignInForm(context),
        ],
      ),
    );
  }

  Widget buildSignInForm(BuildContext context) {
    return Positioned(
      top: sizesApp(context, 250, 350, 450).toDouble(),
      right: sizesApp(context, 25, 50, 75).toDouble(),
      left: sizesApp(context, 25, 50, 75).toDouble(),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ThreeTextFormField(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
            ),
            const SizedBox(height: 20),
            SignInButtom(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
              nameController: nameController,
            ),
            const SizedBox(height: 20),
            BuildOrText(context: context),
            const SizedBox(height: 15),
            const SocialSignIn(),
            const SizedBox(height: 20),
            const RichTextRegister(),
          ],
        ),
      ),
    );
  }
}
