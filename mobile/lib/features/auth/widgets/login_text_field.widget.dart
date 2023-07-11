import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final ScrollController? scrollController;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.onTap,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        onTap: onTap,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF2F2F2),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xFFBEBEBE),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}