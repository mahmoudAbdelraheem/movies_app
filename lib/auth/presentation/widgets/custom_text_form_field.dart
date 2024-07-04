import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String myHintText;
  final TextEditingController myController;
  final bool isPassword;
  final IconData myIcon;
  final TextInputType keyboardType;
  final String? Function(String?) myValidator;
  final VoidCallback? onPressed;
  const CustomTextFormField({
    super.key,
    required this.myHintText,
    required this.myController,
    this.isPassword = false,
    required this.myIcon,
    required this.keyboardType,
    required this.myValidator,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        cursorColor: AppColors.whiteColor,
        controller: myController,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: myValidator,
        decoration: InputDecoration(
          
          hintText: myHintText,
          hintStyle: TextStyle(color: AppColors.whiteColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              myIcon,
              color: AppColors.whiteColor,
            ),
          ),
          filled: true,
          fillColor: AppColors.primaryColor,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
