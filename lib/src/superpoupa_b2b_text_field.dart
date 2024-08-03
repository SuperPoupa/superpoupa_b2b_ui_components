import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuperPoupaB2BTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autoFocus;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final double? height;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final dynamic onChanged;
  final bool? validate;
  final Widget? suffixIcon;


  const SuperPoupaB2BTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    required this.autoFocus,
    required this.enabled,
    this.inputFormatters,
    this.width,
    this.height,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.validate,
    this.suffixIcon,
  });

@override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        validator: (value) => validate == true ? value!.isEmpty ? 'Campo obrigatório' : null : null,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onFieldSubmitted: onSubmitted,
        focusNode: focusNode,    
        onChanged: onChanged,
        enabled: enabled,
      ),
    );
  }
}