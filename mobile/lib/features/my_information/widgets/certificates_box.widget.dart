import 'package:flutter/material.dart';

import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';

class CertificateBox extends StatelessWidget {
  const CertificateBox({
    super.key,
    required this.date,
    required this.campaignName,
    required this.bloodbag,
    required this.place,
  });

  final String date;
  final String campaignName;
  final String bloodbag;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      width: 362,
      height: 121,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 10),
            child: SizedBox(
              width: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyles.smallPoppins1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    campaignName,
                    style: TextStyles.boldPoppins1,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Amount: ',
                          style: TextStyles.boldPoppins2,
                        ),
                        TextSpan(
                          text: bloodbag,
                          style: TextStyles.boldPoppins3,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Blood recipient facility: ',
                          style: TextStyles.boldPoppins2,
                        ),
                        TextSpan(
                          text: place,
                          style: TextStyles.boldPoppins3,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 35),
            child: Stack(
              children: [
                Assets.icons.profile.bloodType.svg(),
                Positioned(
                  top: 23,
                  child: SizedBox(
                    width: 40,
                    child: Text(
                      'B+',
                      style: TextStyles.boldText.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
