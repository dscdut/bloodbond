import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/my_form/widgets/questions_form.widget.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatelessWidget {
  const MyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'TestForm'),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Dành cho người hiến máu',
              style: TextStyle(
                fontFamily: 'BeVietNamPro',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
            child: Container(
              height: 1200,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Có',
                        style: TextStyles.regularFormBVP,
                      ),
                      const SizedBox(width: 25),
                      Text(
                        'Không',
                        style: TextStyles.regularFormBVP,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const QuestionsForm(
                    question: '1. Anh chị đã từng hiến máu chưa?',
                    hasExpanded: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const QuestionsForm(
                    question:
                        '2. Trong vòng 12 tháng gần đây, anh/chị có mắc các bệnh và đã được điều trị khỏi:',
                    hasExpanded: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const QuestionsForm(
                    question:
                        '3. Trong vòng 12 tháng gần đây, anh/chị có mắc các bệnh và đã được điều trị khỏi:',
                  ),
                  const QuestionsForm(
                    question:
                        '• Sốt rét, giang mai, lao, viêm não, phẫu thuật ngoại khoa?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Được truyền máu và các chế phẩm máu?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Tiêm Vacxin bệnh dại?',
                    hasExpanded: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const QuestionsForm(
                    question:
                        '4. Trong vòng 6 tháng gần đây anh/chị có bị một trong những triệu chứng sau không:',
                  ),
                  const QuestionsForm(
                    question: '• Sụt cân nhanh không rõ nguyên nhân?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Nổi hạch kéo dài?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Chữa răng, châm cứu?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Xăm mình, xỏ lỗ tai, lỗ mũi?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Sử dụng ma túy?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question:
                        '• Quan hệ tình dục với người nhiễm HIV hoặc người có hành vi nguy cơ lây nhiễm HIV?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Quan hệ tình dục với người cùng giới',
                    hasExpanded: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const QuestionsForm(
                    question: '5. Trong một tháng gần đây anh/chị có:',
                  ),
                  const QuestionsForm(
                    question:
                        '• Khỏi bệnh sau khi mắc bệnh viêm đường tiết niệu, viêm da nhiễm trùng, viêm phế quản, viêm phổi, sởi, quai bị, Rubella?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Tiêm Vacxin phòng bệnh?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question:
                        '• Đi vào vùng có dịch bệnh lưu hành (sốt xuất huyết, sốt rét, Zika,.. )',
                    hasExpanded: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const QuestionsForm(
                    question: '6. Trong 7 ngày gần đây, anh chị có:',
                  ),
                  const QuestionsForm(
                    question: '• Bị cúm, hoa, nhức đầu sốt...?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question:
                        '• Tiêm Vacxin phòng viên gan siêu vi B, Human Papilloma Virus?',
                    hasExpanded: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const QuestionsForm(
                    question: '7. Câu hỏi dành cho phụ nữ:',
                  ),
                  const QuestionsForm(
                    question:
                        '• Hiện có thai hoặc nuôi con dưới 12 tháng tuổi?',
                    hasExpanded: true,
                  ),
                  const QuestionsForm(
                    question: '• Có kinh nguyệt trong vòng một tuần hay không?',
                    hasExpanded: true,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF2156),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(300, 52),
                ),
                onPressed: () {},
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
