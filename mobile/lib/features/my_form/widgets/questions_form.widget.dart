import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/features/my_form/widgets/checkbox_answer.widget.dart';
import 'package:flutter/material.dart';

class QuestionsForm extends StatelessWidget {
  const QuestionsForm({
    super.key,
    required this.question,
    this.hasExpanded = false,
  });

  final bool hasExpanded;
  final String question;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 19,
        ),
        SizedBox(
          width: 200,
          child: Text(
            question,
            style: TextStyles.regularFormBVP,
            overflow: TextOverflow.visible,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Visibility(
          visible: hasExpanded,
          child: const CheckboxAnswer(),
        ),
      ],
    );
  }
}
