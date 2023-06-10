import 'package:flutter/material.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
      child: Container(
        width: 362,
        height: 121,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.68),
        ),
        child: const Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'June 4th 2023, 23:59',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    color: Color(0xFF7E7E7E),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Operation Name',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Color(0xFF272A2F),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Amount: 100cc',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.58,
                    color: Color(0xFF7E7E7E),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Licensed by: Origanisation Name',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.58,
                    color: Color(0xFF7E7E7E),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Image(image: AssetImage('assets/images/blood.png')),
                    Positioned(
                      right: 5,
                      bottom: 4,
                      child: Text(
                        'B+',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 21,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
