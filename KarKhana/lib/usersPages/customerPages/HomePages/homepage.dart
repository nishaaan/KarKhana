// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields, prefer_const_constructors

import 'dart:async';

import 'package:karkhana/Packages/Packages.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<String> _locationController =
      StreamController<String>();
  late final String _locationData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = context.read<UserCubit>().state;
    _locationData = "${user.location}";
    // simulate fetching location data after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _locationController.add(_locationData);
    });
  }

  @override
  void dispose() {
    _locationController.close();
    super.dispose();
  }

  FetchLocationDeals _DealsInLocation = FetchLocationDeals();

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    int id = user.id!;
    return RefreshIndicator(
        onRefresh: () async {
          GetCart(id);
          setState(() {});
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(95.h),
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
                        LargeText(
                          text: "KarKhana",
                          color: Colours.secondaryColor,
                        ),
                        Row(
                          children: [
                            StreamBuilder<String>(
                              stream: _locationController.stream,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // show a loading indicator if the data is still being fetched
                                  return SizedBox(
                                    height: 15.h,
                                    width: 15.w,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colours.secondaryColor,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  // show an error message if there was an error fetching the data
                                  return smallText(
                                    text: 'Error loading location',
                                    color: Colors.red,
                                  );
                                } else {
                                  // show the location data if it was fetched successfully
                                  return smallText(
                                    text: snapshot.data!,
                                    color: Colours.textColor,
                                  );
                                }
                              },
                            ),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          showSearch(context: context, delegate: SearchUser());
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colours.secondaryColor,
                          ),
                          child: const Icon(
                            Icons.search_outlined,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const FoodDeals()));
                            },
                            child: CategoryContainer(
                              backgroundColor: const Color(0xFFCB1104),
                              categoryName: "Food",
                              categoryImage:
                                  Image.asset('assets/images/pizzas.png'),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: CategorySwimming()));
                            },
                            child: CategoryContainer(
                              backgroundColor: Color(0xFF60CDFF),
                              categoryName: "Swimming",
                              categoryImage:
                                  Image.asset('assets/images/swimming.png'),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const CategoryCarService()));
                            },
                            child: CategoryContainer(
                              backgroundColor: Colours.greyColor,
                              categoryName: "Car Service",
                              categoryImage:
                                  Image.asset('assets/images/servicing.png'),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const CategoryHealth()));
                            },
                            child: CategoryContainer(
                              backgroundColor: Colours.greenColor,
                              categoryName: "Heath",
                              categoryImage: Image.asset(
                                'assets/images/health.png',
                                height: 70.h,
                              ),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Center(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: LargeText(text: "NEAR YOU")),
                        ],
                      ),
                      FutureBuilder(
                          future: _DealsInLocation.getLocationDeals(
                              query: user.location),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Column(
                                      children: [
                                        Lottie.asset(
                                          "assets/lottie/noDealsFound.json",
                                          height: 180,
                                          width: 250,
                                        ),
                                        LargeText(
                                          text: "No Recently Added Deals!",
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Center(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              children: snapshot.data
                                                  .map<Widget>((e) {
                                            String VendorBusiness_Name =
                                                "${e.Business_name}";
                                            String VendorBusiness_Location =
                                                "${e.Business_location}";
                                            // String VendorBusiness_Image =
                                            //     "${e.Business_photo}";
                                            String Deals_Title =
                                                "${e.Deals_title}";
                                            String Deals_Photo =
                                                "${e.Deals_photo}";
                                            int Deals_Price = e.Deals_price;
                                            String Deals_Desc =
                                                "${e.Deals_desc}";
                                            String Deals_category =
                                                "${e.Deals_category}";
                                            String Deals_condition =
                                                "${e.Deals_condition}";
                                            int Deals_Discount =
                                                e.Deals_discount;
                                            String Deals_applicable_time =
                                                "${e.Deals_applicable_time}";
                                            String Deals_applicable_day =
                                                "${e.Deals_applicable_day}";
                                            String Deals_expiry_date =
                                                "${e.Deals_expiry_date}";
                                            int Deal_user = e.Deals_user;
                                            String Vendor_Phone =
                                                "${e.Business_Phone}";
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .rightToLeftWithFade,
                                                        child: scrollDealdetail(
                                                            VendorBusinessName:
                                                                VendorBusiness_Name,
                                                            VendorBusinessLocation:
                                                                VendorBusiness_Location,
                                                            Business_Phone:
                                                                Vendor_Phone,
                                                            // VendorBusinessPhoto:
                                                            //     VendorBusiness_Image,
                                                            Deals_Title:
                                                                Deals_Title,
                                                            Deals_Price:
                                                                Deals_Price,
                                                            Deals_Photo:
                                                                Deals_Photo,
                                                            Deals_Desc:
                                                                Deals_Desc,
                                                            Deals_category:
                                                                Deals_category,
                                                            Deals_condition:
                                                                Deals_condition,
                                                            Deals_Discount:
                                                                Deals_Discount,
                                                            Deals_applicable_time:
                                                                Deals_applicable_time,
                                                            Deals_applicable_day:
                                                                Deals_applicable_day,
                                                            Deals_expiry_date:
                                                                Deals_expiry_date,
                                                            Deal_user:
                                                                Deal_user)));
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 5.h),
                                                child: NearYouDeals(
                                                  VendorBusiness_Name:
                                                      VendorBusiness_Name,
                                                  VendorBusiness_Location:
                                                      VendorBusiness_Location,
                                                  Business_Phone: Vendor_Phone,
                                                  // VendorBusiness_Photo:
                                                  //     VendorBusiness_Image,
                                                  Deals_Title: Deals_Title,
                                                  Deals_Price: Deals_Price,
                                                  Deals_Photo: Deals_Photo,
                                                  Deals_Desc: Deals_Desc,
                                                  Deals_category:
                                                      Deals_category,
                                                  Deals_condition:
                                                      Deals_condition,
                                                  Deals_Discount:
                                                      Deals_Discount,
                                                  Deals_applicable_time:
                                                      Deals_applicable_time,
                                                  Deals_applicable_day:
                                                      Deals_applicable_day,
                                                  Deals_expiry_date:
                                                      Deals_expiry_date,
                                                  Deal_user: Deal_user,
                                                ),
                                              ),
                                            );
                                          }).toList()),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.h,
                                      )
                                    ],
                                  );
                                }
                              } else {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Lottie.asset(
                                        "assets/lottie/search_empty.json",
                                      ),
                                      LargeText(
                                        text: "No Deals Found!",
                                      ),
                                      LargeText(text: "Search Other Deals."),
                                    ],
                                  ),
                                );
                              }
                            }
                          }),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: LargeText(text: "DEALS FOR YOU")),
                        ],
                      ),
                      FutureBuilder(
                          future: DealsData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Column(
                                      children: [
                                        Lottie.asset(
                                          "assets/lottie/noDealsFound.json",
                                          height: 180,
                                          width: 250,
                                        ),
                                        LargeText(
                                          text: "No Recently Added Deals!",
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Center(
                                        child: Column(
                                            children:
                                                snapshot.data.map<Widget>((e) {
                                          String VendorBusiness_Name =
                                              "${e.Business_name}";
                                          String VendorBusiness_Location =
                                              "${e.Business_location}";
                                          // String VendorBusiness_Image =
                                          //     "${e.Business_photo}";
                                          String Deals_Title =
                                              "${e.Deals_title}";
                                          String Deals_Photo =
                                              "${e.Deals_photo}";
                                          int Deals_Price = e.Deals_price;
                                          String Deals_Desc = "${e.Deals_desc}";
                                          String Deals_category =
                                              "${e.Deals_category}";
                                          String Deals_condition =
                                              "${e.Deals_condition}";
                                          int Deals_Discount = e.Deals_discount;
                                          String Deals_applicable_time =
                                              "${e.Deals_applicable_time}";
                                          String Deals_applicable_day =
                                              "${e.Deals_applicable_day}";
                                          String Deals_expiry_date =
                                              "${e.Deals_expiry_date}";
                                          int Deal_user = e.Deals_user;
                                          String Vendor_Phone =
                                              "${e.Business_Phone}";
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .rightToLeftWithFade,
                                                      child: scrollDealdetail(
                                                          VendorBusinessName:
                                                              VendorBusiness_Name,
                                                          VendorBusinessLocation:
                                                              VendorBusiness_Location,
                                                          Business_Phone:
                                                              Vendor_Phone,
                                                          // VendorBusinessPhoto:
                                                          //     VendorBusiness_Image,
                                                          Deals_Title:
                                                              Deals_Title,
                                                          Deals_Price:
                                                              Deals_Price,
                                                          Deals_Photo:
                                                              Deals_Photo,
                                                          Deals_Desc:
                                                              Deals_Desc,
                                                          Deals_category:
                                                              Deals_category,
                                                          Deals_condition:
                                                              Deals_condition,
                                                          Deals_Discount:
                                                              Deals_Discount,
                                                          Deals_applicable_time:
                                                              Deals_applicable_time,
                                                          Deals_applicable_day:
                                                              Deals_applicable_day,
                                                          Deals_expiry_date:
                                                              Deals_expiry_date,
                                                          Deal_user:
                                                              Deal_user)));
                                            },
                                            child: HomeDealContainer(
                                              VendorBusiness_Name:
                                                  VendorBusiness_Name,
                                              VendorBusiness_Location:
                                                  VendorBusiness_Location,
                                              Business_Phone: Vendor_Phone,
                                              // VendorBusiness_Photo:
                                              //     VendorBusiness_Image,
                                              Deals_Title: Deals_Title,
                                              Deals_Price: Deals_Price,
                                              Deals_Photo: Deals_Photo,
                                              Deals_Desc: Deals_Desc,
                                              Deals_category: Deals_category,
                                              Deals_condition: Deals_condition,
                                              Deals_Discount: Deals_Discount,
                                              Deals_applicable_time:
                                                  Deals_applicable_time,
                                              Deals_applicable_day:
                                                  Deals_applicable_day,
                                              Deals_expiry_date:
                                                  Deals_expiry_date,
                                              Deal_user: Deal_user,
                                            ),
                                          );
                                        }).toList()),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      )
                                    ],
                                  );
                                }
                              } else {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Lottie.asset(
                                        "assets/lottie/search_empty.json",
                                      ),
                                      LargeText(
                                        text: "No Deals Found!",
                                      ),
                                      LargeText(text: "Search Other Deals."),
                                    ],
                                  ),
                                );
                              }
                            }
                          }),
                    ],
                  )),
                )
              ],
            ),
          ),
        ));
  }
}
