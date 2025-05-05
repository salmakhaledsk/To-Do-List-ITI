import 'package:flutter/material.dart';

class CustomButtoms extends StatelessWidget {
  final String text;
  final Color color;
  final Color textcolor;
  final String? imagePath;
  final VoidCallback? onPressed;

  const CustomButtoms({
    super.key,
    required this.text,
    required this.color,
    required this.textcolor,
    this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textcolor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null) ...[
            Image.asset(imagePath!, width: 24, height: 24, fit: BoxFit.contain),
            const SizedBox(width: 8),
          ],
          Text(text),
        ],
      ),
    );
  }
}
