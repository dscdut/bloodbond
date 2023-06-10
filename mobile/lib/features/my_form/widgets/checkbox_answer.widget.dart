import 'package:flutter/material.dart';

class CheckboxAnswer extends StatefulWidget {
  const CheckboxAnswer({Key? key}) : super(key: key);

  @override
  CheckboxAnswerState createState() => CheckboxAnswerState();
}

class CheckboxAnswerState extends State<CheckboxAnswer> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedValue = 1;
            });
          },
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor:
                      const Color(0xFFFF576E), // Outline color when unchecked
                ),
                child: Radio<int>(
                  value: 1,
                  groupValue: selectedValue,
                  activeColor: const Color(0xFFFF576E), // Color when checked
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedValue = 2;
            });
          },
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor:
                      const Color(0xFFFF576E), // Outline color when unchecked
                ),
                child: Radio<int>(
                  value: 2,
                  groupValue: selectedValue,
                  activeColor: const Color(0xFFFF576E), // Color when checked
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
