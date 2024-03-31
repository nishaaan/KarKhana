// ignore_for_file: prefer_const_constructors

import 'package:karkhana/Packages/Packages.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Center(
                child: LargeText(
              text: "CONTACT US",
              size: 25,
              color: Colours.secondaryColor,
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Material(
                      elevation: 8,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/logomain.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LargeText(
                        text: "KarKhana",
                        size: 25,
                      ),
                      smallText(
                        text: "Best deals & offer for you",
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      LargeText(
                        text: "Email: ",
                        size: 25,
                      ),
                      smallText(
                        text: "karkhana2024@gmail.com",
                        size: 20,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      LargeText(
                        text: "Contact: ",
                        size: 25,
                      ),
                      smallText(
                        text: "9825998443",
                        size: 20,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      LargeText(
                        text: "Location: ",
                        size: 25,
                      ),
                      smallText(
                        text: "Damak, Jhapa, Nepal",
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
