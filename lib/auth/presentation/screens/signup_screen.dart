import 'package:flutter/material.dart';
import 'package:movies_app/auth/presentation/widgets/custom_logo.dart';
import 'package:movies_app/auth/presentation/widgets/custom_screen_title.dart';
import 'package:movies_app/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies_app/auth/presentation/widgets/custum_button.dart';
import 'package:movies_app/auth/presentation/widgets/have_or_dont_have_account_text.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          //todo add form key
          // key: ,
          child: ListView(
            children: [
              CustomLogo(),
              CustomScreenTitle(title: 'Sign up'),
              //? start text form fields
              CustomTextFormField(
                myHintText: 'email',
                myController: new TextEditingController(),
                myIcon: Icons.email,
                onPressed: () {},
              ),
              CustomTextFormField(
                myHintText: 'password',
                myController: new TextEditingController(),
                myIcon: Icons.remove_red_eye_rounded,
                isPassword: true,
                onPressed: () {},
              ),
          
             
              //? start button
              CustomButton(
                title: 'Sign up',
                onPressed: () {},
              ),
          
              HaveOrDontHaveAccountText(text: 'Login', onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}