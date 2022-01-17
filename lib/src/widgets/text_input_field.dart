import 'package:flutter/material.dart';
import 'package:instagram_clone/src/utils/utils.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  const TextInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: _inputBorder,
        focusedBorder: _inputBorder,
        enabledBorder: _inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
