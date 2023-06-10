import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:flutter/material.dart';

class MyInfoView extends StatelessWidget {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: const CommonAppBar(
        title: 'My Information',
        backgroundColor: ColorStyles.backgroundAppbar,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          const Stack(
            children: [
              SizedBox(
                height: 130,
                width: 200,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: ColorStyles.backgroundAppbar),
                ),
              ),
              Center(
                child: Image(
                  image: AssetImage('assets/images/avatar.png'),
                ),
              ),
              Positioned(
                width: 50,
                height: 50,
                right: 130,
                bottom: 5,
                child: Stack(
                  children: [
                    Image(image: AssetImage('assets/images/blood.png')),
                    Positioned(
                      right: 17,
                      bottom: 5,
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
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Anh Phan',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 26.63,
              color: Color(0xFF272A2F),
            ),
          ),
          const SizedBox(
            height: 54.31,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(const Size(355, 50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(3.8), // Set the border radius
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/my_certification');
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 5,
                ),
                Image(
                  image: AssetImage('assets/images/certificate.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'My Certificate',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.31,
                    color: Color(0xFF7C7C7C),
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF2156),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(const Size(355, 50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(3.8), // Set the border radius
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/report');
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 8,
                ),
                Image(
                  image: AssetImage('assets/images/blood_outlined.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Blood Report  ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.31,
                    color: Color(0xFF7C7C7C),
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF2156),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(const Size(355, 50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(3.8), // Set the border radius
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/my_test_form');
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 5,
                ),
                Image(
                  image: AssetImage('assets/images/form.png'),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Test Form     ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.31,
                    color: Color(0xFF7C7C7C),
                  ),
                ),
                SizedBox(
                  width: 190,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF2156),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
