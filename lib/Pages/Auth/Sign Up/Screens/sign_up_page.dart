import 'package:flutter/material.dart';




import '../../../../Core/Constant/color_app.dart';
import '../../../../Core/Constant/sizes_app.dart';
import '../../../../Core/Widget/custom_top_text.dart';
import '../../Sign In/Widgets/mosque_image.dart';
import '../../Sign In/Widgets/three_text_form_field.dart';
import '../Widgets/sign_up_buttom.dart';

class SignUpPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: sizesApp(context, 80, 110, 150).toDouble(),
            child: const CustomTopText(
              subtext: 'Asalamu Alaikum !!!',
              text: 'Quran App',
            ),
          ),
          Positioned(
            bottom: sizesApp(context, 0, 0, 0).toDouble(),
            child: const MosqueImage(),
          ),
          Positioned(
            top: sizesApp(context, 200, 300, 400).toDouble(),
            left: sizesApp(context, 15, 30, 35).toDouble(),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: sizesApp(context, 14, 16, 18).toDouble(),
                fontFamily: 'Poppins Bold',
                color: ColorApp.heavyPink,
              ),
            ),
          ),
          Positioned(
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
                      passwordController: passwordController),
                  SizedBox(
                    height: sizesApp(context, 20, 40, 60).toDouble(),
                  ),
                  SignUpButtom(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      nameController: nameController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
