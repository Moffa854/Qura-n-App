import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../Core/Constant/color_app.dart';
import '../../../../Core/Constant/sizes_app.dart';
import '../../../../Core/Widget/build_elevated_button.dart';
import '../../../../Core/Widget/create_slide_transation.dart';
import '../../../../cubit/username_cubit.dart';
import '../../../Home/home_page.dart';

class SignInButtom extends StatelessWidget {
  const SignInButtom({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return BuildElevatedButton(
      fontSPhone: 13,
      fontSDesktop: 13,
      fontSTablet: 13,
      phoneWidth: 100,
      tabletWidth: 115,
      desktopWidth: 200,
      phonehight: 50,
      tablethight: 70,
      desktophight: 70,
      borderRadios: sizesApp(context, 10, 15, 20).toDouble(),
      backgroundColor: ColorApp.whitePink,
      colorText: ColorApp.purple,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            )
                .then((value) {
              if (context.mounted) {
                context.read<UsernameCubit>().saveUsername(nameController.text);
                Navigator.of(context).push(
                  createSlideTransation(
                    HomePage(username: nameController.text),
                    const Offset(1.0, 0.1),
                  ),
                );
                nameController.clear();
                passwordController.clear();
                emailController.clear();
              }
            });
          } on FirebaseAuthException catch (e) {
            String errorMessage;
            if (e.code == 'user-not-found') {
              errorMessage = 'No user found for that email.';
            } else if (e.code == 'wrong-password') {
              errorMessage = 'Wrong password provided for that user.';
            } else if (e.code == 'weak-password') {
              errorMessage = 'The password provided is too weak.';
            } else {
              errorMessage = 'An error occurred. Please try again.';
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins SemiBold',
                      color: ColorApp.whitePink,
                    ),
                  ),
                ),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(
                child: Text(
                  'Please enter valid information.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins SemiBold',
                    color: ColorApp.whitePink,
                  ),
                ),
              ),
            ),
          );
        }
      },
      text: 'Sign In',
      fontFamily: 'Poppins SemiBold',
    );
  }
}
