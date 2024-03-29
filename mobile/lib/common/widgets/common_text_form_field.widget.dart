import 'package:bloodbond/common/theme/app_size.dart';
import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.textController,
    this.isObscure = false,
    this.readOnly = false,
    this.extendField = true,
    this.isDense = false,
    this.enabled = true,
    this.isCenterText = false,
    this.hintText,
    this.errorText,
    this.labelText,
    this.initialValue,
    this.borderRadius = 6,
    this.borderColor = ColorStyles.gray100,
    this.focusedBorderColor = ColorStyles.gray100,
    this.fillColor = Colors.white,
    this.hintColor = ColorStyles.gray200,
    this.prefixIconColor,
    this.suffixIconColor,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapPrefixIcon,
    this.onTapSuffixIcon,
    this.labelStyle,
    this.focusNode,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.fontSize = 17,
  })  : assert(
          prefixIcon is Widget || prefixIcon is IconData || prefixIcon == null,
          'prefixIcon must be a Widget or IconData',
        ),
        super(key: key);

  final TextEditingController? textController;

  final bool isObscure;
  final bool readOnly;
  final bool extendField;
  final bool isDense;
  final bool enabled;
  final bool isCenterText;

  final String? hintText;
  final String? errorText;
  final String? labelText;
  final String? initialValue;

  final double borderRadius;

  final Color focusedBorderColor;
  final Color borderColor;
  final Color fillColor;
  final Color hintColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  final IconData? suffixIcon;
  final dynamic prefixIcon;

  final TextInputType? keyboardType;

  final String? Function(String?)? validator;

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onTapPrefixIcon;
  final VoidCallback? onTapSuffixIcon;

  final TextStyle? labelStyle;

  final FocusNode? focusNode;

  final int maxLines;

  final EdgeInsetsGeometry? contentPadding;

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: labelStyle ?? TextStyles.s14MediumText,
          ),
        if (labelText != null)
          const SizedBox(
            height: 5,
          ),
        TextFormField(
          controller: textController,
          maxLines: maxLines,
          focusNode: focusNode,
          textInputAction: TextInputAction.done,
          onChanged: onChanged,
          onTap: onTap,
          validator: validator,
          obscureText: isObscure,
          readOnly: readOnly,
          enableSuggestions: false,
          enabled: enabled,
          keyboardType: keyboardType,
          initialValue: initialValue,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF000000),
          ),
          textAlign: isCenterText ? TextAlign.center : TextAlign.start,
          decoration: InputDecoration(
            isDense: isDense,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: fontSize - 1,
              color: hintColor,
              fontWeight: FontWeight.w500,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: ColorStyles.red600,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusedBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: ColorStyles.red600,
              ),
            ),
            filled: true,
            fillColor: fillColor,
            contentPadding: contentPadding,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: AppSize.buttonAndTextFieldHeight,
              maxWidth: AppSize.buttonAndTextFieldHeight,
              minHeight: AppSize.buttonAndTextFieldHeight,
              minWidth: AppSize.buttonAndTextFieldHeight,
            ),
            prefixIcon: prefixIcon != null
                ? GestureDetector(
                    onTap: onTapPrefixIcon,
                    behavior: HitTestBehavior.opaque,
                    child: prefixIcon is IconData
                        ? Icon(
                            prefixIcon,
                            color: prefixIconColor,
                          )
                        : prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onTapSuffixIcon,
                    behavior: HitTestBehavior.opaque,
                    child: Icon(
                      suffixIcon,
                      color: suffixIconColor,
                    ),
                  )
                : null,
            helperText: extendField ? '' : null,
            helperStyle: extendField
                ? TextStyles.regularText.copyWith(fontSize: fontSize - 3)
                : null,
            errorText: errorText == '' || errorText == null ? null : errorText,
            errorStyle: TextStyles.regularText.copyWith(
              color: Colors.red,
              fontSize: fontSize - 3,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
