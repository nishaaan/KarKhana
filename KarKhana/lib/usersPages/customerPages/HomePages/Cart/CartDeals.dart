// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_string_interpolations, prefer_adjacent_string_concatenation

import 'package:karkhana/Packages/Packages.dart';

class CartDealsDetails extends StatefulWidget {
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
  int Customer_User;
  int Vendor_User;

  CartDealsDetails({
    super.key,
    required this.VendorBusinessName,
    required this.Business_Phone,
    // required this.Business_photo,
    required this.Business_location,
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
    required this.Customer_User,
    required this.Vendor_User,
  });

  @override
  State<CartDealsDetails> createState() => _CartDealsDetailsState();
}

class _CartDealsDetailsState extends State<CartDealsDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String photo = widget.Deals_Photo;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
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
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18),
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
                                offset: const Offset(
                                    0, 2) // changes position of shadow
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
                                size: 28,
                              ),
                              smallText(
                                  text: "By " + "${widget.VendorBusinessName}"),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: height * 0.04,
                                width: width * 0.2,
                                color: Colours.greenColor,
                                child: Center(
                                  child: LargeText(
                                    text: "${widget.Deals_Discount}" + "%OFF",
                                    color: Color.fromARGB(255, 43, 140, 93),
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                                                color: Colours.backgroundColor,
                                                fontWeight: FontWeight.bold),
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
                                            color:
                                                Color.fromARGB(255, 2, 126, 55),
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
                                                color: Colours.backgroundColor,
                                                fontWeight: FontWeight.bold),
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
                                                color: Colours.backgroundColor,
                                                fontWeight: FontWeight.bold),
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
                                  maxline: 50, text: "${widget.Deals_Desc}"),
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
                              ButtonContainer(
                                  butborderColor: Colours.secondaryColor,
                                  text: "Buy Coupon",
                                  butColor: Colours.secondaryColor,
                                  onClick: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(50.0),
                                        ),
                                      ),
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return SizedBox(
                                          height: 360.h,
                                          child: PaymentPage(
                                            VendorBusinessName:
                                                widget.VendorBusinessName,
                                            // Business_photo:
                                            //     widget.Business_photo,
                                            Business_location:
                                                widget.Business_location,
                                            Business_Phone:
                                                widget.Business_Phone,
                                            Deals_Title: widget.Deals_Title,
                                            Deals_Price: widget.Deals_Price,
                                            // Deals_Photo:
                                            //     widget.Deals_Photo,
                                            Deals_Desc: widget.Deals_Desc,
                                            Deals_category:
                                                widget.Deals_category,
                                            Deals_condition:
                                                widget.Deals_condition,
                                            Deals_Discount:
                                                widget.Deals_Discount,
                                            Deals_applicable_time:
                                                widget.Deals_applicable_time,
                                            Deals_applicable_day:
                                                widget.Deals_applicable_day,
                                            Deals_expiry_date:
                                                widget.Deals_expiry_date,
                                            Customer_User: widget.Customer_User,
                                            Vendor_User: widget.Vendor_User,
                                          ),
                                        );
                                      },
                                    );
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
    );
  }
}
