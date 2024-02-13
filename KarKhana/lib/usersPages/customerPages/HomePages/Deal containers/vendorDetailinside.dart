// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable

import 'package:karkhana/Packages/Packages.dart';

class SpecificVendorDetail extends StatefulWidget {
  String VendorBusiness_Name;
  String? VendorBusiness_Email;
  String? VendorBusiness_PhoneNumber;
  String? VendorBusiness_Location;
  String? VendorBusiness_about;
  String? VendorBusiness_opening_time;
  String? VendorBusiness_opening_days;
  int BusinessID;

  SpecificVendorDetail(
      {super.key,
      required this.VendorBusiness_Name,
      this.VendorBusiness_Email,
      this.VendorBusiness_PhoneNumber,
      this.VendorBusiness_Location,
      this.VendorBusiness_about,
      this.VendorBusiness_opening_time,
      this.VendorBusiness_opening_days,
      required this.BusinessID});

  @override
  State<SpecificVendorDetail> createState() => _SpecificVendorDetailState();
}

class _SpecificVendorDetailState extends State<SpecificVendorDetail> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 90.h),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        // height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colours.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.8,
                blurRadius: 2,
                offset: Offset(0, 2) // changes position of shadow
                ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LargeText(text: "${widget.VendorBusiness_Name}"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width * 0.35,
                            decoration: BoxDecoration(
                                color: Colours.blueColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    size: 35,
                                    color: Color.fromARGB(255, 50, 72, 236),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LargeText(
                                        text: "Time",
                                        color: Colours.backgroundColor,
                                        size: 15,
                                      ),
                                      Text(
                                        "${widget.VendorBusiness_opening_time}",
                                        style: const TextStyle(
                                            color: Colours.backgroundColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            height: height * 0.1,
                            width: width * 0.35,
                            decoration: BoxDecoration(
                                color: Colours.greenColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.calendar_month_outlined,
                                    size: 35,
                                    color: Color.fromARGB(255, 2, 126, 55),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LargeText(
                                        text: "Day",
                                        color: Colours.backgroundColor,
                                        size: 15,
                                      ),
                                      Text(
                                        "${widget.VendorBusiness_opening_days}",
                                        style: const TextStyle(
                                            color: Colours.backgroundColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        LargeText(
                          text: "Email: ",
                          size: 15,
                        ),
                        smallText(text: "${widget.VendorBusiness_Email}"),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        LargeText(
                          text: "Location: ",
                          size: 15,
                        ),
                        smallText(text: "${widget.VendorBusiness_Location}"),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        LargeText(
                          text: "Contact: ",
                          size: 15,
                        ),
                        smallText(text: "${widget.VendorBusiness_PhoneNumber}"),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    LargeText(
                      text: "About Business: ",
                      size: 15,
                    ),
                    smallText(
                      text: "${widget.VendorBusiness_about}",
                      maxline: 4,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LargeText(
                          text: "Reviews & Ratings",
                          size: 15,
                        ),
                        GestureDetector(
                          onTap: () {
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
                                  height: 400.h,
                                  child: ReviewRatingForm(
                                    businessID: widget.BusinessID,
                                    businessName: widget.VendorBusiness_Name,
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(
                            Icons.rate_review_outlined,
                            color: Colours.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                      future: GetReviewsRating(widget.BusinessID),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        Widget widget = Text("");
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
                            if (snapshot.hasData && snapshot.data.isEmpty) {
                              widget = Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Center(
                                      child: smallText(
                                          text: "No Review Available!")
                                      // Lottie.asset(
                                      //     'Assets/LottieAnimations/No_Data_Found_Lottie.json',
                                      //     height: 220.h,
                                      //     width: 250.w),
                                      ),
                                ],
                              );
                            } else {
                              widget = Column(
                                children: [
                                  Center(
                                    child: Column(
                                        children:
                                            snapshot.data.map<Widget>((e) {
                                      int Review_ID = e.ReviewRating_ID;
                                      String Review = "${e.Review}";
                                      double Rating = e.Rating;
                                      String Customer_Name =
                                          "${e.CustomerName}";

                                      String Business_Name =
                                          "${e.Business_Name}";

                                      return reviewContainer(
                                        CustomerName: Customer_Name,
                                        Rating: Rating,
                                        review: Review,
                                      );
                                    }).toList()),
                                  ),
                                ],
                              );
                            }
                          } else {
                            widget = const Center(child: Text("NO DATA"));
                          }
                        }

                        return widget;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
