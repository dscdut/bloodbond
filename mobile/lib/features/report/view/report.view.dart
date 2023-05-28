import 'package:bloodbond/common/constants/blood_enum.dart';
import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/common/widgets/icon_title.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/report/report.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodIngredientUIModel {
  BloodIngredientUIModel({
    required this.quantity,
    required this.unit,
    required this.type,
  });

  final double quantity;
  final BloodIngredientUnit unit;
  final BloodIngredientType type;
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportBloc(),
      child: const _ReportView(),
    );
  }
}

class _ReportView extends StatefulWidget {
  const _ReportView();

  @override
  State<_ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<_ReportView> {
  final List<BloodIngredientUIModel> _ingredients = [
    BloodIngredientUIModel(
      quantity: 6,
      unit: BloodIngredientUnit.mol,
      type: BloodIngredientType.glucose,
    ),
    BloodIngredientUIModel(
      quantity: 6.2,
      unit: BloodIngredientUnit.mol,
      type: BloodIngredientType.cholesterol,
    ),
    BloodIngredientUIModel(
      quantity: 12,
      unit: BloodIngredientUnit.mol,
      type: BloodIngredientType.bilirubin,
    ),
    BloodIngredientUIModel(
      quantity: 3.6,
      unit: BloodIngredientUnit.ml,
      type: BloodIngredientType.rbc,
    ),
    BloodIngredientUIModel(
      quantity: 102,
      unit: BloodIngredientUnit.fl,
      type: BloodIngredientType.mcv,
    ),
    BloodIngredientUIModel(
      quantity: 276,
      unit: BloodIngredientUnit.bl,
      type: BloodIngredientType.platelets,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Report',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.horizontalSpace),
        child: Column(
          children: [
            const IconTitle(
              icon: Icons.fmd_good_outlined,
              title: 'Research Center',
            ),
            Text(
              'Dhaka Medical College, Dhaka.',
              style: TextStyles.s14MediumText.copyWith(color: ColorStyles.gray),
            ),
            Padding(
              padding: EdgeInsets.only(right: 60, top: 40.h, bottom: 40.h),
              child: Assets.images.decoration.report.svg(),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 30,
                childAspectRatio: 3 / 2.3,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final ingredient = _ingredients[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 30,
                        color: const Color(0xFF424242).withOpacity(0.1),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ingredient.quantity.toString(),
                              style: TextStyles.mediumText.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            TextSpan(
                              text: ingredient.unit.name.toString(),
                              style: TextStyles.s14MediumText,
                            )
                          ],
                        ),
                      ),
                      Text(
                        ingredient.type.name,
                        style: TextStyles.mediumText.copyWith(
                          fontSize: 16.sp,
                          color: ColorStyles.gray300,
                        ),
                      )
                    ],
                  ),
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
