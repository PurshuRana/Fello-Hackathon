//Author: Purushotham
//Created On: 09-12-2023

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FelloTextFieldWidget extends StatelessWidget {
  const FelloTextFieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    required this.label,
    required this.hint,
    this.textInputType,
    this.suffixIcon,
    this.onTap,
    this.inputFormatters,
    this.obscure = false,
    this.textInputAction,
    this.onChanged,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.textStyle

  });
  final TextEditingController controller;
  final String? Function(String? text) validator;
  final String? label;
  final String hint;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscure;
  final TextInputAction? textInputAction;
  final Function(String? text)? onChanged;
  final bool enabled;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      textAlign: textAlign,
      style: textStyle,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(width: 0.50, color: Color(0x231E3E3C)),
        ),
        labelText: label,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        suffixIcon: suffixIcon,
      ),
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      obscureText: obscure,
      onTap: onTap,
      textInputAction: textInputAction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}

