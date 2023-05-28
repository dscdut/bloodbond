import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignAdvertisingSlider extends StatefulWidget {
  const CampaignAdvertisingSlider({super.key});

  @override
  State<CampaignAdvertisingSlider> createState() =>
      _CampaignAdvertisingSliderState();
}

class _CampaignAdvertisingSliderState extends State<CampaignAdvertisingSlider> {
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  final CarouselController _carouselController = CarouselController();
  final List<String> _images = [
    'https://post.healthline.com/wp-content/uploads/2020/09/Blood_Donation-732X549-thumbnail.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnNsbhyXcO2J2olt66c_oGd31Xr1_VGCuKnlMbdHzogtq9_k-X2RmpOkbbkBUB6r7gDog&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTslncQA7SjCMcCWq2Xt0YgCe_M1gNLrlNyA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb6DPROxRxUAfeti9TjJAc0bMN7GUsZqLzig&usqp=CAU'
  ];

  void _onTapIndicator(int newIndex) {
    _carouselController.animateToPage(
      newIndex,
      curve: Curves.easeIn,
    );
  }

  void _onPageChanged(int index) {
    _currentPageNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 4,
          carouselController: _carouselController,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 3 / 1.6,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => _onPageChanged(index),
          ),
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                _images[index],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 10.w,
          child: ValueListenableBuilder(
            valueListenable: _currentPageNotifier,
            builder: (context, value, child) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onTapIndicator(index),
                    child: Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: index == value
                            ? ColorStyles.primary
                            : ColorStyles.gray200,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 4,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
