import 'package:bloodbond/features/donation_request/widgets/blood_type_dropdown/blood_type_dropdown.widget.dart';
import 'package:bloodbond/features/donation_request/widgets/request_text_field.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRequestForm extends StatelessWidget {
  const CreateRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const RequestTextField(
            hint: 'City',
            icon: Icons.fmd_good_outlined,
          ),
          RequestTextField(
            hint: 'City',
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Assets.icons.request.hospital.svg(),
            ),
          ),
          const BloodTypeDropdown(),
          RequestTextField(
            hint: 'Mobile',
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Assets.icons.request.phone.svg(),
            ),
          ),
          RequestTextField(
            hint: 'Notes',
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Transform.translate(
                offset: Offset(0, -34.h),
                child: Assets.icons.request.note.svg(),
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 10, 0),
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
