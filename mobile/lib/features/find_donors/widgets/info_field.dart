import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  const InfoField({
    super.key,
    this.descriptionTitle = 'This is title',
  });

  final String descriptionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 242),
          child: Text(
            descriptionTitle,
            style: const TextStyle(
              color: Color(0xFF272A2F),
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 9.65,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
          child: Expanded(
            child: Container(
              height: 110,
              width: 357,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color(0xFFCDCDCD),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 11,
        )
      ],
    );
  }
}
