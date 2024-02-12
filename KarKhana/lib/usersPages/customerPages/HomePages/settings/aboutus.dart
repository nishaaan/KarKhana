// ignore_for_file: prefer_const_constructors

import 'package:karkhana/Packages/Packages.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: SingleChildScrollView(
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
                text: "ABOUT US",
                size: 25,
                color: Colours.secondaryColor,
              )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LargeText(
                              text: "KarKhana",
                              size: 25,
                            ),
                            smallText(
                              maxline: 200,
                              text:
                                  "Karkhana is a mobile application that enables businesses to advertise customers discounts and offers. This app is developed to add value to Nepalese customers and businesses. It serves as a platform for users to sign up and search for deals, offers, discounts, and sales at different businesses that are registered with KarKhana. Users can also buy coupons to make these services of discounted offers available via the KarKhana mobile app. However, you need a working/current mobile phone number. Companies can advertise various discount offerings on our site in a variety of ways. It enables businesses to display a wide range of customizable promotions, such as off-hour discounts, happy hour specials, meal-specific or combo offers, weekday or weekend specials, and more. Businesses in the hospitality sector, including restaurants, spas, saloons, carwashes, driving schools, music academies, recreation centers, health and fitness centers, futsal teams, photography studios, dental offices, and other businesses, are welcome to join the platform and share the most amazing deals they have to offer.",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        LargeText(text: "Benefits for User"),
                        ListTile(
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                          ),
                          title: smallText(
                            text:
                                'Discover incredible Deals that local businesses',
                            maxline: 2,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                          ),
                          title: smallText(
                            text:
                                'Using a digital payment method, purchase the Deals you want.',
                            maxline: 2,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                          ),
                          title: smallText(
                            text:
                                'Use the KarKhana app to visit companies directly and redeem your discount.',
                            maxline: 3,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        LargeText(text: "Benefits for Business"),
                        ListTile(
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                          ),
                          title: smallText(
                            text:
                                'Obtain new clients by offering alluring discounts.',
                            maxline: 2,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                          ),
                          title: smallText(
                            text:
                                'Promote attractive happy hour discounts to boost business after hours.',
                            maxline: 3,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                          ),
                          title: smallText(
                            text:
                                'Obtain greater client visibility by registering on the KarKhana platform.',
                            maxline: 3,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                          ),
                          title: smallText(
                            text:
                                'Create dynamic discount programs with time constraints (daily, weekly, monthly, or yearly).',
                            maxline: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
