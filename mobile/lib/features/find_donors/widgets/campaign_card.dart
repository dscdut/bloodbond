import 'package:flutter/material.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({
    super.key,
    required this.campaignImage,
  });

  final String campaignImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        width: 336,
        height: 172,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.68),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Image.asset(campaignImage),
            const SizedBox(
              height: 4.5,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\t\t\t\tJune 4th 2023, 23:59',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF515151),
                  fontSize: 13,
                  fontFamily: 'BeVietNamPro',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\t\t\t\tCampaign Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF272A2F),
                  fontSize: 13,
                  fontFamily: 'BeVietNamPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
