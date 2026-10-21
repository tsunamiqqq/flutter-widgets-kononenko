import 'package:flutter/material.dart';

enum CustomButtonStyle {
  primary,
  secondary,
  danger,
  outline,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonStyle style;
  final Widget? icon;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style = CustomButtonStyle.primary,
    this.icon,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      switch (style) {
        case CustomButtonStyle.secondary:
          return Colors.grey;
        case CustomButtonStyle.danger:
          return Colors.red;
        case CustomButtonStyle.outline:
          return Colors.transparent;
        case CustomButtonStyle.primary:
        default:
          return Colors.blue;
      }
    }

    Color getTextColor() {
      if (style == CustomButtonStyle.outline) return Colors.blue;
      return Colors.white;
    }

    Widget buttonContent = isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(color: getTextColor(), fontSize: 16),
              ),
            ],
          );


    if (style == CustomButtonStyle.outline) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blue, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: buttonContent,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: getBackgroundColor(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: buttonContent,
    );
  }
}
