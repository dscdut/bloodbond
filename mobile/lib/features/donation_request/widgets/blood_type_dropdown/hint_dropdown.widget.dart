import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/features/donation_request/widgets/blood_type_dropdown/blood_icon.widget.dart';
import 'package:flutter/material.dart';

class HintDropdown extends StatelessWidget {
  const HintDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BloodIcon(),
        Transform.translate(
          offset: const Offset(-10, 0),
          child: Text(
            'Blood Type',
            style: TextStyles.s14RegularText.copyWith(
              color: ColorStyles.gray200,
            ),
          ),
        )
      ],
    );
  }
}
