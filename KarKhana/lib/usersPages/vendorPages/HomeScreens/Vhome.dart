// ignore_for_file: file_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors, non_constant_identifier_names

import 'package:karkhana/Packages/Packages.dart';

class VendorHomePage extends StatefulWidget {
  VendorHomePage({super.key});

  @override
  State<VendorHomePage> createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;

    double width = MediaQuery.of(context).size.height * 1;

    int id = user.id!;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: LargeText(
                          text: "KarKhana",
                          color: Colours.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: VendorSetting()));
                      },
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colours.secondaryColor,
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colours.backgroundColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(PageTransition(
                type: PageTransitionType.rightToLeft,
                child: VendorAddDeals(),
              ));
            },
            backgroundColor: Colours.secondaryColor,
            child: const Icon(Icons.add)),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Container(
                width: width,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colours.backgroundColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0.09,
                                blurRadius: 0.2,
                                offset: const Offset(
                                    0.2, -3) // changes position of shadow
                                ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 180.h,
                              ),
                              LargeText(text: "Recently Added Deals"),
                              FutureBuilder<List<Deals?>>(
                                future: SpecificDealsData(id),
                                builder: (context, snapshot) {
                                  // Widget widget = const Text("");
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                      child: Text("Something went wrong"),
                                    );
                                  } else {
                                    if (snapshot.hasData) {
                                      if (snapshot.hasData &&
                                          snapshot.data!.isEmpty) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 20.h),
                                          child: Container(
                                            width: width,
                                            child: Column(
                                              children: [
                                                Lottie.asset(
                                                  "assets/lottie/noDealsFound.json",
                                                  height: 180,
                                                  width: 250,
                                                ),
                                                LargeText(
                                                  text:
                                                      "No Recently Added Deals!",
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Column(
                                          children: [
                                            Center(
                                                child: Column(
                                              children: snapshot.data!
                                                  .map<Widget>((e) {
                                                return RecentContainer(
                                                  dealTitle:
                                                      "${e!.Deals_title}",
                                                  businessName: "${user.name}",
                                                  discount: e.Deals_discount,
                                                  frontLabel: "Status",
                                                  newLabel: "Added",
                                                  smallboxColor:
                                                      Colours.greenColor,
                                                  smallboxWidght: 0.3,
                                                );
                                              }).toList(),
                                            )),
                                          ],
                                        );
                                      }
                                    } else {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          children: [
                                            Lottie.asset(
                                              "assets/lottie/search_empty.json",
                                            ),
                                            LargeText(
                                              text: "No Deals Found!",
                                            ),
                                            LargeText(
                                                text: "Search Other Deals."),
                                          ],
                                        ),
                                      );
                                    }
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
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
                                    "assets/images/businessprofile.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        LargeText(
                          text: user.name!,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ButtonContainer(
                          butborderColor: Colours.secondaryColor,
                          text: "Upload Profile",
                          butColor: Colours.secondaryColor,
                          onClick: () async {
                            int pk = user.id!;
                            String BusinessName = user.name!;
                            String BusinessEmail = user.email!;
                            String BusinessPhone = user.phonenumber!;
                            String BusinessToken = user.token!;
                            String BusinessLocation = user.location!;
                            String BusinessAbout = user.VendorBusiness_about!;
                            String BusinessOpenDays =
                                user.VendorBusiness_opening_days!;
                            String BusinessOpenTime =
                                user.VendorBusiness_opening_time!;
                            var authResponse = await postVendorBusinessDetails(
                              pk,
                              BusinessName,
                              BusinessEmail,
                              BusinessPhone,
                              BusinessToken,
                              BusinessLocation,
                              BusinessAbout,
                              BusinessOpenDays,
                              BusinessOpenTime,
                            );
                            if (authResponse.runtimeType == String) {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: LargeText(
                                          text: 'Business Information Upload',
                                          size: 16,
                                        ),
                                        content: const Text(
                                          "Your Business information has been successfully uploaded to BriskDeals system.",
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Close'))
                                        ],
                                      ));
                            } else {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: LargeText(
                                          text: 'Business Information Upload',
                                          size: 16,
                                        ),
                                        content: const Text(
                                          "Your Business information has already been uploaded to KarKhana system.",
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Close'))
                                        ],
                                      ));
                            }
                          },
                          height: 5,
                          width: 130,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
