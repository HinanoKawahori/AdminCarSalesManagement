import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    super.key,
    required this.passwordController,
    required this.title,
    required this.imagePath,
  });

  final TextEditingController passwordController;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: ColorStyle.mainBlack,
          fontSize: CustomFontSize.normal,
        ),
        labelText: title,
        prefixIcon: Padding(
          padding: PaddingStyle.small,
          child: Image.asset(
            width: 10,
            height: 10,
            imagePath,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorStyle.secondGrey), // グレーのボーダー
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorStyle.secondGrey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
