import 'package:bloodbond/common/constants/blood_enum.dart';
import 'package:bloodbond/common/theme/app_shadow.dart';
import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/features/donation_request/widgets/blood_type_dropdown/hint_dropdown.widget.dart';
import 'package:bloodbond/features/donation_request/widgets/blood_type_dropdown/selected_dropdown_item.widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BloodTypeDropdown extends StatefulWidget {
  const BloodTypeDropdown({super.key});

  @override
  State<BloodTypeDropdown> createState() => _BloodTypeDropdownState();
}

class _BloodTypeDropdownState extends State<BloodTypeDropdown> {
  final List<BloodType> _bloodTypes = [
    BloodType.aPlus,
    BloodType.aMinus,
    BloodType.bPlus,
    BloodType.bMinus,
    BloodType.oPlus,
    BloodType.abPlus,
    BloodType.abMinus,
  ];

  BloodType? _selectedType;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          height: AppSize.buttonAndTextFieldHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: AppShadow.requestFieldShadow,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.only(right: 10),
        ),
        onChanged: (value) {
          setState(() {
            _selectedType = value;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          helperText: '',
          helperStyle: TextStyles.regularText.copyWith(fontSize: 13),
          errorStyle: TextStyles.regularText
              .copyWith(color: Colors.red, fontSize: 13, height: 0),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 1,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.only(left: AppSize.horizontalSpace),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ColorStyles.zodiacBlue,
          ),
        ),
        hint: const HintDropdown(),
        value: _selectedType,
        items: _bloodTypes.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.name),
          );
        }).toList(),
        selectedItemBuilder: (context) {
          return _bloodTypes.map((e) {
            return SelectedDropdownItem(value: _selectedType?.name ?? '');
          }).toList();
        },
      ),
    );
  }
}
