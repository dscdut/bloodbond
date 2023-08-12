import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/common_rounded_button.widget.dart';
import '../../../common/widgets/common_text_form_field.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_text.widget.dart';

class InformationItem extends StatefulWidget {
  const InformationItem({
    super.key,
    required this.icon,
    required this.title,
    this.route,
  });

  final SvgGenImage icon;
  final String title;
  final String? route;

  @override
  State<InformationItem> createState() => _InformationItemState();
}

class _InformationItemState extends State<InformationItem> {
  final double _height = 55.h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Navigator.of(context).pushNamed(widget.route!);
        } else {
          showModalBottomSheet(
            barrierColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return FractionallySizedBox(
                heightFactor: 1.25,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      toolbarHeight: 0,
                      automaticallyImplyLeading: false,
                      bottom: TabBar(
                        indicator: BoxDecoration(
                          border: Border.all(
                            color: ColorStyles.Red1,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'Personal Information',
                              style: TextStyles.bVPred,
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Health Information',
                              style: TextStyles.bVPred,
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: LoginCustomText(
                                  text: 'Phone Number',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 0, 40, 0),
                                child: AppTextFormField(
                                  hintText: '0585703870',
                                  fillColor: ColorStyles.concrete,
                                  hintColor: ColorStyles.gray,
                                  borderRadius: 20,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 22,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: LoginCustomText(
                                  text: 'Email',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 0),
                                child: AppTextFormField(
                                  hintText: 'quannguyenbk59@gmail.com',
                                  fillColor: ColorStyles.concrete,
                                  hintColor: ColorStyles.gray,
                                  borderRadius: 20,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 22,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: LoginCustomText(
                                  text: 'Address',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 0),
                                child: AppTextFormField(
                                  hintText: 'P304 Chung cu Hoa Minh, Phu Thanh',
                                  fillColor: ColorStyles.concrete,
                                  hintColor: ColorStyles.gray,
                                  borderRadius: 20,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 22,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              const SizedBox(height: 60),
                              CommonRoundedButton(
                                width: 238,
                                onPressed: () {},
                                backgroundColor: ColorStyles.primary,
                                content: 'Update',
                                textStyle: TextStyles.s17BoldText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: LoginCustomText(
                                  text: 'Blood Type',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 0),
                                child: AppTextFormField(
                                  hintText: 'A+',
                                  fillColor: ColorStyles.concrete,
                                  hintColor: ColorStyles.gray,
                                  borderRadius: 20,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 22,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: LoginCustomText(
                                  text: 'Weight',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 0),
                                child: AppTextFormField(
                                  hintText: '70kg',
                                  fillColor: ColorStyles.concrete,
                                  hintColor: ColorStyles.gray,
                                  borderRadius: 20,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 22,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: LoginCustomText(
                                  text: 'Height',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 0),
                                child: AppTextFormField(
                                  hintText: '180cm',
                                  fillColor: ColorStyles.concrete,
                                  hintColor: ColorStyles.gray,
                                  borderRadius: 20,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 22,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: LoginCustomText(
                                  text: 'Most recent blood donation',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 0),
                                child: AppTextFormField(
                                  hintText: 'exhausted',
                                  fillColor: ColorStyles.concrete,
                                  hintColor: ColorStyles.gray,
                                  borderRadius: 20,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 22,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              CommonRoundedButton(
                                width: 238,
                                onPressed: () {},
                                backgroundColor: ColorStyles.primary,
                                content: 'Update',
                                textStyle: TextStyles.s17BoldText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
      child: Container(
        height: _height,
        padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 26,
              spreadRadius: -6,
              color: const Color(0xFF565656).withOpacity(0.12),
            )
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Container(
              width: _height,
              height: _height,
              padding: EdgeInsets.all(18.h),
              child: widget.icon.svg(),
            ),
            Expanded(
              child: Text(
                widget.title,
                style:
                    TextStyles.s17MediumText.copyWith(color: ColorStyles.gray),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.red,
              size: 23,
            )
          ],
        ),
      ),
    );
  }
}
