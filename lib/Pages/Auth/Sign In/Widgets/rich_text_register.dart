import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constant/color_app.dart';
import '../../../../Core/Constant/sizes_app.dart';
import '../../../../Core/Widget/create_slide_transation.dart';
import '../../Sign Up/Screens/sign_up_page.dart';

class RichTextRegister extends StatelessWidget {
  const RichTextRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
        TextSpan(
            text: 'Don’t have an account ?',
            style: TextStyle(
              color: ColorApp.purple,
              fontSize:
                  sizesApp(context, 11, 13, 16).toDouble(),
              fontFamily: 'Poppins Regular',
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push(
                  createSlideTransation(
                    SignUpPage(),
                    const Offset(1.0, 0.1),
                  ),
                );
              },
            text: ' Register here',
            style: TextStyle(
              color: const Color(0xff0E18F6),
              fontSize:
                  sizesApp(context, 11, 13, 16).toDouble(),
              fontFamily: 'Poppins Regular',
            ),
          ),
        ],
      ),
    );
  }
}