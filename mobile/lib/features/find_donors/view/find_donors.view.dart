import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/find_donors/widgets/donor_card.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/find_donors/find_donors.dart';

class FindDonorsPage extends StatelessWidget {
  const FindDonorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FindDonorsBloc(),
      child: const _FindDonorsView(),
    );
  }
}

class _FindDonorsView extends StatefulWidget {
  const _FindDonorsView();
  @override
  State<_FindDonorsView> createState() => _FindDonorsViewState();
}

class _FindDonorsViewState extends State<_FindDonorsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: CommonAppBar(
        backgroundColor: ColorStyles.backgroundAppbar,
        toolbarHeight: AppSize.appBarHeight + kToolbarHeight,
        title: 'Search',
        bottom: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 45.64,
                  width: 299.53,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(4.75),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 22.82,
                      ),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Color(0xFFCDCDCD),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 45.64,
                height: 45.64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF2156),
                  ),
                  onPressed: () {},
                  child: Assets.icons.appBar.location.svg(),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: const [
          DonorCard(),
          DonorCard(),
          DonorCard(),
          DonorCard(),
        ],
      ),
    );
  }
}
