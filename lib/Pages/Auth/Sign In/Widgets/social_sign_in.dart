import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../Core/Constant/images_app.dart';
import '../../../../Core/Constant/sizes_app.dart';
import '../../../../Core/Widget/create_slide_transation.dart';
import '../../../../cubit/Username/username_cubit.dart';
import '../../../Home/Screens/home_page.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    super.key,
  });
Future<UserCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            signInWithGoogle().then(
              (UserCredential userCredential) {
                final String? email =
                    userCredential.user?.email;
    
                String username =
                    email?.split('@')[0] ?? 'No Username';
    
                if (context.mounted) {
                  context
                      .read<UsernameCubit>()
                      .saveUsername(username);
                  Navigator.of(context).push(
                    createSlideTransation(
                      HomePage(
                        username: username,
                      ),
                      const Offset(1.0, 1.0),
                    ),
                  );
                }
              },
            );
          },
          child: Image.asset(
            fit: BoxFit.contain,
            ImagesApp.googlelogo,
            width: sizesApp(context, 15, 30, 45).toDouble(),
            height: sizesApp(context, 15, 30, 45).toDouble(),
          ),
        ),
        Image.asset(
          fit: BoxFit.contain,
          ImagesApp.facebooklogo,
          width: sizesApp(context, 15, 30, 45).toDouble(),
          height: sizesApp(context, 15, 30, 45).toDouble(),
        ),
        Image.asset(
          fit: BoxFit.contain,
          ImagesApp.applelogo,
          width: sizesApp(context, 15, 30, 45).toDouble(),
          height: sizesApp(context, 15, 30, 45).toDouble(),
        ),
      ],
    );
  }
}