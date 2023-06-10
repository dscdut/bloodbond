import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/my_test_form/widgets/question_form.widget.dart';
import 'package:flutter/material.dart';

class MyTestFormView extends StatelessWidget {
  const MyTestFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: const CommonAppBar(
        title: 'Test Form',
        backgroundColor: ColorStyles.backgroundAppbar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 59,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Dành cho người hiến máu',
                  style: TextStyle(
                    fontFamily: 'BeVietNamPro',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 31,
            ),
            const QuestionForm(),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFF2156)),
                minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
