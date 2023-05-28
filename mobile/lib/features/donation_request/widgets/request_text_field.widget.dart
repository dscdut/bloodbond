import 'package:bloodbond/common/theme/app_shadow.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_text_form_field.widget.dart';
import 'package:flutter/material.dart';

class RequestTextField extends StatelessWidget {
  const RequestTextField({
    super.key,
    required this.icon,
    required this.hint,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20),
  });

  final String hint;
  final dynamic icon;
  final int maxLines;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: AppShadow.requestFieldShadow,
      ),
      child: AppTextFormField(
        hintText: hint,
        prefixIcon: icon,
        prefixIconColor: ColorStyles.primary,
        borderColor: Colors.transparent,
        maxLines: maxLines,
        contentPadding: contentPadding,
      ),
    );
  }
}
