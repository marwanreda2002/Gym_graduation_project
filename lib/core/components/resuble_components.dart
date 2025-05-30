import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../utils/app_images.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed, this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style:textStyle?? AppStyles.regular24black),
    );
  }
}

class CustomBackButtonCircle extends StatelessWidget {
  const CustomBackButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: ImageIcon(
          AssetImage(AppImages.backArrowLight),
          color: AppColors.primaryColor,
          size: 32.sp,
        ));
  }
}

class CustomLinearProgress extends StatelessWidget {
  final double value;

  const CustomLinearProgress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      color: AppColors.primaryColor,
      backgroundColor: AppColors.greyColor,
      minHeight: 14.h,
      borderRadius: BorderRadius.circular(6.r),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final Function()? onSuffixPressed;
  final TextEditingController controller;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
        required this.hintText,
        required this.validator,
        this.hintStyle,
        this.suffixIcon,
        this.prefixIcon,
        this.isObscure,
        required this.controller,
        this.borderColor,
        this.onChanged,
        this.keyboardType,
        this.onSuffixPressed});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return TextFormField(
      validator:validator ,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: isObscure ?? false,
      controller: controller,
      style: AppStyles.regular16primary,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 13.h,
          horizontal: 10.w
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.015),
          child: IconButton(
            onPressed: onSuffixPressed,
            icon: Icon(suffixIcon!),
            color: AppColors.primaryColor,
          ),
        )
            : null,
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.primaryColor,
        suffixIconColor: AppColors.primaryColor,
        hintText: hintText,
        hintStyle: AppStyles.regular15grey,
        // errorStyle: AppStyles.bold12Red,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color:Colors.red,
          ),
        ),
      ),
    );
  }
}

class classTrainersButton extends StatelessWidget {
  classTrainersButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  void Function()? onPressed;
  String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r)),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 144.w)
      ),
      onPressed: onPressed,
      child: Text(name, style: AppStyles.regular18white,),);
  }
}

