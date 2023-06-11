import 'package:flutter/material.dart';

class OperationInfo extends StatelessWidget {
  const OperationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 9,
          child: Container(
            height: 5,
            width: 77,
            decoration: const BoxDecoration(
              color: Color(0xFFBEBEBE),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            Image.asset('assets/images/campaignx2.png'),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: Text(
                'Operation Name',
                style: TextStyle(
                  fontFamily: 'BeVietNamPro',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 12.54,
            ),
            const Center(
              child: Text(
                'Organisation Name',
                style: TextStyle(
                  color: Color(0xFF515151),
                  fontSize: 13.31,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(
              height: 40.31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Color(0xFFFF2456),
                    ),
                    fixedSize: const Size(149, 49),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Color(0xFFFF2456),
                      ),
                      SizedBox(
                        width: 17.33,
                      ),
                      Text(
                        'Contact',
                        style: TextStyle(
                          color: Color(0xFFFF2456),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF2456),
                    fixedSize: const Size(149, 49),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            width: 800,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Are you sure want to aplly?',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFBEBEBE),
                                        fixedSize: const Size(100, 33),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFF2156),
                                        fixedSize: const Size(100, 33),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35,
                      ),
                      SizedBox(
                        width: 16.74,
                      ),
                      Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 56,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 242),
              child: Text(
                'Description',
                style: TextStyle(
                  color: Color(0xFF272A2F),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 9.65,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: Expanded(
                child: Container(
                  height: 110,
                  width: 357,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFCDCDCD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 290),
              child: Text(
                'Time',
                style: TextStyle(
                  color: Color(0xFF272A2F),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 9.65,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: Expanded(
                child: Container(
                  height: 53,
                  width: 357,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFCDCDCD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 285),
              child: Text(
                'Place',
                style: TextStyle(
                  color: Color(0xFF272A2F),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 9.65,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: Expanded(
                child: Container(
                  height: 53,
                  width: 357,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFCDCDCD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 290),
              child: Text(
                'Host',
                style: TextStyle(
                  color: Color(0xFF272A2F),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 9.65,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: Expanded(
                child: Container(
                  height: 53,
                  width: 357,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFCDCDCD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 155),
              child: Text(
                'Number of participants',
                style: TextStyle(
                  color: Color(0xFF272A2F),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 9.65,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: Expanded(
                child: Container(
                  height: 53,
                  width: 357,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFCDCDCD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ],
    );
  }
}
