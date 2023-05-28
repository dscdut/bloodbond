import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/features/donation_request/widgets/blood_type_dropdown/blood_icon.widget.dart';
import 'package:flutter/material.dart';

class SelectedDropdownItem extends StatelessWidget {
  const SelectedDropdownItem({super.key, required this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BloodIcon(),
        Transform.translate(
          offset: const Offset(-10, 0),
          child: Text(
            value,
            style: TextStyles.s14RegularText,
          ),
        )
      ],
    );
  }
}
