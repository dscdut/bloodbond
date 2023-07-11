import 'package:bloodbond/common/theme/app_size.dart';
import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/loading_dot.widget.dart';

class CommonRoundedButton extends StatelessWidget {
  CommonRoundedButton({
    Key? key,
    required this.onPressed,
    this.width,
    this.height = AppSize.buttonAndTextFieldHeight,
    this.borderRadius = 7,
    this.elevation = 0,
    this.backgroundColor = ColorStyles.blue400,
    this.disableBackgroundColor = ColorStyles.gray300,
    this.shadowColor,
    required this.content,
    TextStyle? textStyle,
    this.isDisable = false,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.child,
    this.borderSide,
  })  : textStyle =
            textStyle ?? TextStyles.s14BoldText.copyWith(color: Colors.white),
        super(key: key);

  final VoidCallback onPressed;

  final double? width;
  final double height;
  final double borderRadius;
  final double elevation;

  final Color backgroundColor;
  final Color disableBackgroundColor;
  final Color? shadowColor;

  final String content;

  final TextStyle textStyle;

  final bool isLoading;
  final bool isDisable;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? child;

  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color:
                  isDisable ? Colors.transparent : Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset:
                  const Offset(0, 2), // Điều chỉnh vị trí của hiệu ứng inwell
            ),
          ],
        ),
        child: Theme(
          data: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                  isDisable ? disableBackgroundColor : backgroundColor,
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  isDisable ? disableBackgroundColor : backgroundColor,
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  isDisable ? disableBackgroundColor : backgroundColor,
                ),
                elevation: MaterialStateProperty.resolveWith<double>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused)) {
                      return 0;
                    }
                    return elevation;
                  },
                ),
              ),
            ),
          ),
          child: ElevatedButton(
            onPressed: (isLoading || isDisable) ? null : onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: borderSide ?? BorderSide.none,
              ),
              shadowColor: shadowColor,
              splashFactory: NoSplash.splashFactory,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              disabledBackgroundColor: disableBackgroundColor,
              disabledForegroundColor: disableBackgroundColor,
              enableFeedback: false,
            ),
            child: isLoading
                ? const LoadingDot()
                : (child ??
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (prefixIcon != null)
                            Row(
                              children: [
                                prefixIcon!,
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          Text(
                            content,
                            style: textStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (suffixIcon != null)
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                suffixIcon!
                              ],
                            ),
                        ],
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
