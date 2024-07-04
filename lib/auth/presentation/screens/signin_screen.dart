import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/data/models/user_model.dart';
import 'package:movies_app/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:movies_app/auth/presentation/widgets/custom_logo.dart';
import 'package:movies_app/auth/presentation/widgets/custom_screen_title.dart';
import 'package:movies_app/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies_app/auth/presentation/widgets/custum_button.dart';
import 'package:movies_app/auth/presentation/widgets/have_or_dont_have_account_text.dart';
import 'package:movies_app/core/functions/show_snake_bar.dart';
import 'package:movies_app/core/functions/validate_text_form.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/core/shared/custom_loading_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> signinFromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          //todo add form key
          key: signinFromKey,
          child: ListView(
            children: [
              CustomLogo(),
              CustomScreenTitle(title: 'Sign in'),
              //? start text form fields
              CustomTextFormField(
                myHintText: 'email',
                myController: emailController,
                myIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                myValidator: (value) {
                  if (value != null && isValidEmail(emailController.text)) {
                    return null;
                  } else {
                    return 'email is not vaild';
                  }
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  bool isPasswordVisible = false;
                  if (state is PasswordState) {
                    isPasswordVisible = state.isPasswordVisible;
                  }

                  return CustomTextFormField(
                    myHintText: 'password',
                    myController: passwordController,
                    myIcon: isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isPassword: !isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    onPressed: () {
                      context.read<AuthBloc>().add(TogglePasswordVisibility());
                    },
                    myValidator: (value) {
                      if (value != null &&
                          isValidPassword(passwordController.text)) {
                        return null;
                      } else {
                        return 'week password';
                      }
                    },
                  );
                },
              ),

              //? start forgot password
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.redColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              //? start button
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    showSnackBar(
                      'Login done suceessfuly!',
                      Colors.black,
                      AppColors.goldColor,
                      context,
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      AppConstance.movieScreen,
                    );
                  }else if(state is LoginErrorState){
                    showSnackBar(
                      state.message,
                      AppColors.whiteColor,
                      AppColors.redColor,
                      context,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CustomLoadingWidget(),
                    );
                  } else {
                    return CustomButton(
                      title: 'Sign in',
                      onPressed: () {
                        if(signinFromKey.currentState!.validate()){
                           BlocProvider.of<AuthBloc>(context).add(
                          LoginEvent(
                            user: UserModel(
                              uid: '',
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                      
                        }
                       },
                    );
                  }
                },
              ),

              HaveOrDontHaveAccountText(
                text: 'Sign up',
                isLogin: false,
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, AppConstance.signupScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
