import 'package:flutter/material.dart';

import 'package:bloodbond/features/my_test_form/widgets/question_item.widget.dart';

class QuestionForm extends StatelessWidget {
  const QuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 990,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(4.73)),
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 25,
          ),
          QuestionItem(question: '1. Anh chị đã từng hiến máu chưa?'),
          SizedBox(
            height: 25,
          ),
          QuestionItem(
            question:
                '2. Hiện tại, anh/chị có các bệnh:viêm\nkhớp, đau dạ dày, viêm gian/vàng da\n,bệnh tim, huyết áp thấp/cao, hen, ho\nkéo dài, bênh máu, lao',
          ),
          SizedBox(
            height: 25,
          ),
          QuestionItem(
            question:
                '3. Trong vòng 12 tháng gần đây, anh/chị có\nmắc các bệnh và đã được điều trị khỏi:\n\n•Sốt rét, Giang mai, Lao, Viêm não,\nPhẫu thuật ngoại khoa\n\n•Được truyền máu và các chế phẩm máu?\n\n•Tiêm Vacxin bệnh dại.',
          ),
          SizedBox(
            height: 25,
          ),
          QuestionItem(
            question:
                '4. Trong vòng 6 tháng gần đây, anh/chị có\nbị một trong số các triệu chứng sau không:\n\n•Sụt cân nhanh không rõ nguyên nhân\n\n•Nổi hạch kéo dài\n\n•Chữa răng, châm cứu\n\n•Xăm mình, xỏ lỗ tai, lỗ mũi\n\n•Sử dụng ma túy\n\n•Quan hệ tình dục với người nhiễm HIV\nhoặc người có hành vi nguy cơ lây nhiễm\n\n•HIV?Quan hệ tình dục với người cùng giới',
          ),
          SizedBox(
            height: 25,
          ),
          QuestionItem(
            question:
                '5. Trong 01 tháng gần đây anh/chị có:\n\n•Khỏi bệnh sau khi mắc bệnh viêm đường\ntiết niệu, viêm da nhiễm trùng, viêm phế\nquản, viêm phổi, sởi, quai bị, Rubella\n\n•Tiêm vắc xin phòng bệnh\n\n•Đi vào vùng có dịch bệnh lưu hành\n(sốt rét, sốt xuất huyết, Zika,...)',
          ),
          SizedBox(
            height: 25,
          ),
          QuestionItem(
            question:
                '6. Trong 07 ngày gần đây anh/chị có:\n\n•Bị cúm, ho, nhức đầu, sốt....\n\n•Tiêm Vacxin phòng Viêm gan siêu vi B,\n Human Papilloma Virus ',
          ),
          SizedBox(
            height: 25,
          ),
          QuestionItem(
            question:
                '7. Câu hỏi dành cho phụ nữ:\n\n•Hiện có thai, hoặc nuôi con dưới 12\ntháng tuổi\n\n•Có kinh nguyệt trong vòng một tuần hay\nkhông',
          ),
        ],
      ),
    );
  }
}
