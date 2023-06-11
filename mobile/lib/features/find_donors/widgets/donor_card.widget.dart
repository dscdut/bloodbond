import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class DonorCard extends StatelessWidget {
  const DonorCard({
    this.organisationName = 'Organisation Name',
    this.campaignName = 'Campaign Name',
    super.key,
  });

  final String organisationName;
  final String campaignName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
      child: Container(
        width: 362,
        height: 141.32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.68),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Assets.images.campaign.image(
              width: 79,
              height: 79,
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 46,
                ),
                Text(
                  organisationName,
                  style: const TextStyle(
                    color: Color(0xFF515151),
                    fontFamily: 'Poppins',
                    fontSize: 11,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  campaignName,
                  style: const TextStyle(
                    color: Color(0xFF272A2F),
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
