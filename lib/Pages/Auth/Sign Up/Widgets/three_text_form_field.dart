import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Constant/color_app.dart';
import '../../../../cubit/Bool/boolvisibility_cubit.dart';
import '../../Widgets/custom_text_form_feild.dart';

class ThreeTextFormField extends StatelessWidget {
  const ThreeTextFormField({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFeild(
          hintText: 'name',
          controller: nameController,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormFeild(
          hintText: 'email',
          controller: emailController,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<BoolvisibilityCubit, bool>(
          builder: (context, state) {
            return CustomTextFormFeild(
              hintText: 'password',
              controller: passwordController,
              obscureText: state ? false : true,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<BoolvisibilityCubit>().taggel();
                },
                icon: state
                    ? const Icon(
                        Icons.visibility,
                        color: ColorApp.purple,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: ColorApp.purple,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
