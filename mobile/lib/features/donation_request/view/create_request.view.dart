import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/features/donation_request/widgets/create_request_form.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRequestView extends StatelessWidget {
  const CreateRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Create A Request',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.horizontalSpace),
        child: Column(
          children: [
            const CreateRequestForm(),
            const SizedBox(
              height: 30,
            ),
            CommonRoundedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      contentPadding: const EdgeInsets.all(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        // alignment: WrapAlignment.center,
                        // runAlignment: WrapAlignment.center,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        // direction: Axis.vertical,
                        children: [
                          Assets.images.decoration.requestSuccess.svg(),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Blood is successfully requested.',
                            textAlign: TextAlign.center,
                            style: TextStyles.mediumText.copyWith(
                              fontSize: 18.sp,
                              color: const Color(0xFF263238).withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).popUntil(
                              ModalRoute.withName(AppRouter.root),
                            ),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                color: ColorStyles.primary,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              content: 'Request',
              backgroundColor: ColorStyles.primary,
              width: context.width / 2,
            )
          ],
        ),
      ),
    );
  }
}
