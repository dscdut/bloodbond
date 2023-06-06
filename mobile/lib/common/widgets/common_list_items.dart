import 'package:flutter/material.dart';

class CommonListItems extends StatelessWidget {
  const CommonListItems({
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
            Image.asset(
              'assets/images/Ellipse27.png',
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
                    color: Color(0xFF7E7E7E),
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
