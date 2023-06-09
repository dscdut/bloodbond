import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/features/core/widgets/nav_bar_item.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/core/bloc/root.bloc.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  final List<SvgGenImage?> _icons = [
    Assets.icons.bottomNavigation.home,
    Assets.icons.bottomNavigation.search,
    null,
    Assets.icons.bottomNavigation.notification,
    Assets.icons.bottomNavigation.profile,
  ];

  void _changeTab(int newIndex) {
    context.read<RootBloc>().add(RootBottomTabChange(newIndex: newIndex));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.transparent,
          notchMargin: 8,
          elevation: 0,
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.horizontalSpace,
                  vertical: context.paddingBottom != 0 ? 0 : 10,
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border:
                        Border.all(color: ColorStyles.gray100.withOpacity(0.5)),
                    // boxShadow: AppTheme.primaryShadow,
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _icons
                        .asMap()
                        .map((e, icon) {
                          if (icon == null) {
                            return MapEntry(e, const Spacer());
                          }

                          return MapEntry(
                            e,
                            NavigationBarItem(
                              icon: icon,
                              isSelected: state.currentIndex == e,
                              onTap: () => _changeTab(e),
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      buildWhen: (previous, current) {
        return previous.currentIndex != current.currentIndex;
      },
    );
  }
}
