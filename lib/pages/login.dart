import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_learning/services/auth_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth_learning/utils/app_colors.dart';
import 'package:firebase_auth_learning/widgets/custom_button.dart';
import 'package:firebase_auth_learning/widgets/custom_textfield.dart';
import 'package:firebase_auth_learning/widgets/error_dialog.dart';
import 'package:firebase_auth_learning/widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;
  const LoginPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: AppColors.black),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (mounted) Navigator.pop(context);

      if (e.code == 'invalid-credential') {
        if (mounted) {
          errorDialog(
            context,
            'Invalid Credentials',
            'Please check your email and password',
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Lock.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: AppColors.black75percent,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    isObscured: false,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isObscured: true,
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.black75percent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: CustomButton(
                      text: 'Sign In',
                      onPressed: signUserIn,
                      textColor: AppColors.white,
                      buttonColor: AppColors.black,
                      radius: 8,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: AppColors.black75percent),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        imagePath: 'assets/images/Google.png',
                        onTap: () => AuthServices().signInWithGoogle(),
                      ),
                      const SizedBox(width: 10),
                      SocialButton(
                        imagePath: 'assets/images/Facebook.png',
                        onTap: () => AuthServices().signInWithFacebook(),
                      ),
                      const SizedBox(width: 10),
                      SocialButton(
                        imagePath: 'assets/images/Git.png',
                        onTap: () => AuthServices().signInWithGithub(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text.rich(
                    TextSpan(
                      text: 'Not a member? ',
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onTap,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
