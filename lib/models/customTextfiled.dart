import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    super.key,
    required this.hittext,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.hitcolor,
  });

  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String hittext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Color? hitcolor;
  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? obscureText : false,
      style: TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: widget.hittext,
        hintStyle: TextStyle(color: widget.hitcolor),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
                : widget.suffixIcon,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
