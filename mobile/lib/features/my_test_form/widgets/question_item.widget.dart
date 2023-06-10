import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key, required this.question});
  final String question;

  @override
  State<QuestionItem> createState() {
    return _QuestionItemState();
  }
}

class _QuestionItemState extends State<QuestionItem> {
  bool firstValue = false;
  bool secondValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(
          widget.question,
          style: TextStyles.regularFormBVP,
        ),
      ],
    );
  }
}
