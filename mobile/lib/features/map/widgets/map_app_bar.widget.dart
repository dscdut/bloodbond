import 'package:bloodbond/common/constants/blood_enum.dart';
import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:flutter/material.dart';

class MapAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MapAppBar({super.key, this.toolbarHeight = AppSize.appBarHeight});

  final double toolbarHeight;

  @override
  State<MapAppBar> createState() => _MapAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _MapAppBarState extends State<MapAppBar> {
  final List<BloodType> bloodTypes = [
    BloodType.aPlus,
    BloodType.aMinus,
    BloodType.bPlus,
    BloodType.bMinus,
    BloodType.abPlus,
    BloodType.abMinus,
    BloodType.oPlus,
    BloodType.oMinus,
  ];

  BloodType? bloodType;

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      toolbarHeight: widget.toolbarHeight,
      leadingWidth: 0,
      leading: const SizedBox(),
      title: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<BloodType>(
                  hint: Text(
                    'Blood type',
                    style: TextStyles.boldText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  isExpanded: true,
                  value: bloodType,
                  onChanged: (value) {
                    setState(() {
                      bloodType = value;
                    });
                  },
                  icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  items: bloodTypes
                      .map(
                        (e) => DropdownMenuItem<BloodType>(
                          value: e,
                          child: Text(
                            e.name,
                            style: TextStyles.boldText.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Limit',
                  hintStyle: TextStyles.boldText.copyWith(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 24,
                    maxWidth: 24,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Find'),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      hasBoxDecoration: false,
    );
  }
}
