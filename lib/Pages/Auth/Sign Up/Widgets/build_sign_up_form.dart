import 'package:flutter/material.dart';

import '../../../../Core/Constant/sizes_app.dart';
import '../../Sign In/Widgets/three_text_form_field.dart';
import 'sign_up_buttom.dart';

class BuildSignUpForm2 extends StatelessWidget {
  const BuildSignUpForm2({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.context,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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
            SignUpButtom(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
              nameController: nameController,
            ),
          ],
        ),
      ),
    );
  }
}