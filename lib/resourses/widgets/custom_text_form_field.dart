import 'package:flutter/material.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';

class CustomTextFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final Icon? icon;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.focusNode,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.hintText,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      style: TextStyle(color: AppColor.greyColor, fontSize: Dimensions.font16),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(color: AppColor.greyColor, fontSize: Dimensions.font16),
        prefixIcon: icon,
        prefixIconColor: AppColor.primaryColor,
        constraints: BoxConstraints(
          maxHeight: Dimensions.height10 * 6,
          maxWidth: double.infinity,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
        ),
      ),
    );
  }
}
