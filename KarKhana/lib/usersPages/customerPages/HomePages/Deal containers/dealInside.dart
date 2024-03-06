// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, file_names, prefer_const_constructors, unnecessary_string_interpolations, unused_import, prefer_adjacent_string_concatenation

import 'dart:io';

import 'package:karkhana/API/auth_api.dart';
import 'package:karkhana/Packages/Packages.dart';

class mainDetailedDeals extends StatefulWidget {
  String VendorBusinessName;
  String Business_location;
  String Business_Phone;
  // String Business_photo;
  String Deals_Title;
  String Deals_Photo;
  String Deals_Desc;
  String Deals_category;
  String Deals_condition;

  int Deals_Discount;
  int Deals_Price;
  String Deals_applicable_time;
  String Deals_applicable_day;
  String Deals_expiry_date;
  int Deal_user;
  mainDetailedDeals({
    super.key,
    required this.VendorBusinessName,
    // required this.Business_photo,
    required this.Business_location,
    required this.Business_Phone,
    required this.Deals_Title,
    required this.Deals_Price,
    required this.Deals_Photo,
    required this.Deals_Desc,
    required this.Deals_category,
    required this.Deals_condition,
    required this.Deals_Discount,
    required this.Deals_applicable_time,
    required this.Deals_applicable_day,
    required this.Deals_expiry_date,
    required this.Deal_user,
  });

  @override
  State<mainDetailedDeals> createState() => _mainDetailedDealsState();
}

class _mainDetailedDealsState extends State<mainDetailedDeals> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double n = height * 0.2;
    int id = user.id!;

    String photo = widget.Deals_Photo;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios_rounded),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                LargeText(text: "${widget.VendorBusinessName}"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50.h, left: 12.w),
            child: Container(
              width: width * 0.92,
              decoration: BoxDecoration(
                color: Colours.backgroundColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.8,
                    blurRadius: 2,
                    // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: width * 0.92,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: height * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(photo),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: n),
                          child: Container(
                            width: width * 0.92,
                            decoration: BoxDecoration(
                              color: Colours.backgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1.8,
                                  blurRadius: 2,
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LargeText(
                                    text: "${widget.Deals_Title}",
                                    maxline: 2,
                                  ),
                                  smallText(
                                      text: "By " +
                                          "${widget.VendorBusinessName}"),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    height: height * 0.04,
                                    width: width * 0.2,
                                    color: Colours.greenColor,
                                    child: Center(
                                      child: LargeText(
                                        text:
                                            "${widget.Deals_Discount}" + "%OFF",
                                        color: Color.fromARGB(255, 43, 140, 93),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.2,
                                          width: width * 0.26,
                                          decoration: BoxDecoration(
                                              color: Colours.blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.watch_later_outlined,
                                                size: 35,
                                                color: Color.fromARGB(
                                                    255, 50, 72, 236),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              LargeText(
                                                text: "Time",
                                                color: Colours.backgroundColor,
                                                size: 15,
                                              ),
                                              Text(
                                                "${widget.Deals_applicable_time}",
                                                style: const TextStyle(
                                                    color:
                                                        Colours.backgroundColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          height: height * 0.2,
                                          width: width * 0.26,
                                          decoration: BoxDecoration(
                                              color: Colours.greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.calendar_month_outlined,
                                                size: 35,
                                                color: Color.fromARGB(
                                                    255, 2, 126, 55),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              LargeText(
                                                text: "Day",
                                                color: Colours.backgroundColor,
                                                size: 15,
                                              ),
                                              Text(
                                                "${widget.Deals_applicable_day}",
                                                style: const TextStyle(
                                                    color:
                                                        Colours.backgroundColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          height: height * 0.2,
                                          width: width * 0.26,
                                          decoration: BoxDecoration(
                                              color: Colours.errorColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.gpp_bad_outlined,
                                                size: 35,
                                                color: Color.fromARGB(
                                                    255, 245, 159, 159),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              LargeText(
                                                text: "Expire",
                                                color: Colours.backgroundColor,
                                                size: 15,
                                              ),
                                              Text(
                                                "${widget.Deals_expiry_date}",
                                                style: const TextStyle(
                                                    color:
                                                        Colours.backgroundColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  LargeText(text: "Description"),
                                  smallText(
                                      maxline: 50,
                                      text: "${widget.Deals_Desc}"),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  LargeText(text: "Condition"),
                                  smallText(
                                      maxline: 50,
                                      text: "${widget.Deals_condition}"),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  ButtonContainerIcon(
                                      butborderColor: Colours.secondaryColor,
                                      text: "Add to Cart ",
                                      icon: Icons.shopping_cart_outlined,
                                      butColor: Colours.secondaryColor,
                                      onClick: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title:
                                                      const Text('Add to Cart'),
                                                  content: const Text(
                                                      'Do you want this Item to add in your Cart?'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () async {
                                                          setState(() {});

                                                          postCart(
                                                            widget
                                                                .VendorBusinessName,
                                                            // widget
                                                            //     .Business_photo,
                                                            widget
                                                                .Business_location,
                                                            widget.Deals_Title,
                                                            widget.Deals_Price,
                                                            widget
                                                                .Deals_category,
                                                            widget.Deals_Desc,
                                                            widget
                                                                .Deals_condition,
                                                            widget
                                                                .Deals_Discount,
                                                            widget
                                                                .Deals_applicable_time,
                                                            widget
                                                                .Deals_applicable_day,
                                                            widget
                                                                .Deals_expiry_date,
                                                            id,
                                                            widget.Deal_user,

                                                            widget
                                                                .Business_Phone,
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text('YES')),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('NO'))
                                                  ],
                                                ));
                                      }),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
