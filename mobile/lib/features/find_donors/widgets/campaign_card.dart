import 'package:flutter/material.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Container(
        width: 336,
        height: 196,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.68),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Image.asset('assets/images/campaign1.png'),
            const SizedBox(
              height: 4.5,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\t\t\t\tJune 4th 2023, 23:59',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF7E7E7E),
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
