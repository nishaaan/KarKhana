// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, file_names

import 'package:karkhana/Packages/Packages.dart';
// import 'package:brisk_deals/user_screens/Customer/Homescreens/settings/userSettings.dart';

class btmNavigationBar extends StatefulWidget {
  btmNavigationBar({
    super.key,
  });

  @override
  State<btmNavigationBar> createState() => _btmNavigationBarState();
}

var currentIndex = 0;

class _btmNavigationBarState extends State<btmNavigationBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> screens = <Widget>[
      // HomePage(),
      AddToCart(),
      // purchases(),
      UserSettings(),
    ];
    List<IconData> listOfIcons = [
      Icons.home_outlined,
      Icons.shopping_cart_outlined,
      Icons.currency_rupee_outlined,
      Icons.person_2_outlined,
    ];

    List<String> labels = [
      "Home",
      "Cart",
      "Purchases",
      "Profile",
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        height: (size.width * .176).h,
        decoration: BoxDecoration(
          color: Colours.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colours.textColor.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: (size.width * .02).w),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 0, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1400),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                      right: size.width * .0400,
                      left: size.width * .0400,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                    decoration: const BoxDecoration(
                      color: Colours.secondaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == currentIndex
                        ? Colours.secondaryColor
                        : Colours.greyColor,
                  ),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: index == currentIndex
                          ? Colours.secondaryColor
                          : Colours.greyColor,
                    ),
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
