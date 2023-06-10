import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class MapSearchButtonWidget extends StatelessWidget {
  const MapSearchButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: CommonRoundedButton(
          width: double.infinity,
          onPressed: () {},
          backgroundColor: Colors.white,
          textStyle: TextStyles.s14RegularText.copyWith(
            color: ColorStyles.zodiacBlue,
          ),
          content: 'Enter your address',
          borderRadius: 15,
          prefixIcon: Assets.icons.bottomNavigation.search.svg(
            height: 24,
          ),
        ),
      ),
    );
  }
}
