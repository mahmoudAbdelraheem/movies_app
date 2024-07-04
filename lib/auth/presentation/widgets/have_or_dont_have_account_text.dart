import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class HaveOrDontHaveAccountText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLogin;
  const HaveOrDontHaveAccountText(
      {super.key, required this.text, required this.onTap, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? 'Have an account? ' : 'Don\'t have an account? ',
          style: TextStyle(color: AppColors.whiteColor, fontSize: 14),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(color: AppColors.redColor, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
