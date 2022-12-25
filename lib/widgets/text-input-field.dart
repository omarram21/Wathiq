import 'package:flutter/material.dart';
import 'package:wathiq/constans.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;

  const TextInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isObscure = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.GRAY,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.BLUE,
              )),
        ),
        obscureText: isObscure,
      ),
    );
  }
}
