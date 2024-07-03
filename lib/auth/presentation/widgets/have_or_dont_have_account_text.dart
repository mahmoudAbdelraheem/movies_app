import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class HaveOrDontHaveAccountText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const HaveOrDontHaveAccountText({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text == 'Login' ? 'Have an account? ': 'Don\'t have an account? ',
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    text,
                    style: TextStyle(color: AppColors.redColor, fontSize: 18),
                  ),
                ),
              ],
            );
  }
}