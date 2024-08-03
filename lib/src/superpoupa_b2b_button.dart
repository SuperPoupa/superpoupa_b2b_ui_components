import 'package:flutter/material.dart';

class SuperPoupaB2BButton extends StatelessWidget {
  final String label;
  final double width;
  final VoidCallback onClick;
  final String? variant;
  final double? height;
  final double? fontSize;
  final Color? color;
  final bool? isLoading;

  const SuperPoupaB2BButton({
    super.key,
    required this.label,
    required this.width,
    required this.onClick,
    this.variant = 'primary',
    this.height,
    this.fontSize,
    this.color = Colors.orange,
    this.isLoading = false,
  });

@override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(variant == 'primary' ? color : Colors.white),
        maximumSize: WidgetStateProperty.all(Size(width, height ?? 45)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: color!),
          ),
        ),
      ),
      child: Center(
        child: isLoading == true ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator()) : Text(
          label,
          style: TextStyle(fontSize: fontSize ?? 14, color: variant == 'primary' ? Colors.white : color),
        ),
      ),
    );
  }
}