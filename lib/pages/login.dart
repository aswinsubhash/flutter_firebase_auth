import 'package:firebase_auth_learning/utils/app_colors.dart';
import 'package:firebase_auth_learning/widgets/custom_button.dart';
import 'package:firebase_auth_learning/widgets/custom_textfield.dart';
import 'package:firebase_auth_learning/widgets/social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                controller: usernameController,
                hintText: 'Username',
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    imagePath: 'assets/images/Google.png',
                  ),
                  SizedBox(width: 10),
                  SocialButton(
                    imagePath: 'assets/images/Github.png',
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Text.rich(
                TextSpan(
                  text: 'Not a member? ',
                  children: [
                    TextSpan(
                      text: 'Register now',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
