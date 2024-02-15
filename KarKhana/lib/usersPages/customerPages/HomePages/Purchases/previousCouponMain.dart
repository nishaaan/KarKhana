// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, unused_local_variable

import 'package:karkhana/Packages/Packages.dart';

class PreviousCoupon extends StatefulWidget {
  int id;
  bool isVendor;
  PreviousCoupon({
    super.key,
    required this.id,
    this.isVendor = false,
  });

  @override
  State<PreviousCoupon> createState() => _PreviousCouponState();
}

class _PreviousCouponState extends State<PreviousCoupon> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: FutureBuilder(
          future: widget.isVendor
              ? GetVendorCouponDetails(widget.id)
              : GetCouponDetails(widget.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.hasData && snapshot.data.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Center(
                        child: Lottie.asset(
                          'assets/lottie/noDealsFound.json',
                          height: 200.h,
                          width: 200.w,
                        ),
                      ),
                      LargeText(
                        text: "No Deals In Cart",
                        size: 18,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Center(
                        child: Column(
                            children: snapshot.data.map<Widget>((e) {
                          int couponId = int.parse("${e.couponID}");
                          String Deals_title = "${e.deal_title}";
                          int Deals_discount = int.parse("${e.deal_discount}");
                          String Deals_applicable_time =
                              "${e.deal_applicable_time}";
                          String Deals_applicable_day =
                              "${e.deal_applicable_day}";
                          String Deals_expiry_date = "${e.deal_expiry_date}";
                          int Customer_User = e.Customer_user;
                          int Deals_user = e.Vendor_user;

                          String Business_name = "${e.VendorBusiness_Name}";
                          String Business_location =
                              "${e.VendorBusiness_Location}";
                          String Business_Phone = "${e.Vendor_Phone}";
                          int Total_coupon_price =
                              int.parse("${e.Total_Coupon_Price}");
                          String CustomerName = "${e.Customer_Name}";
                          String CustomerEmail = "${e.Customer_Email}";
                          String CustomerLocation = "${e.Customer_Address}";
                          String CustomerPhone = "${e.Customer_Phonenumber}";
                          String coupon_Status = "${e.coupon_Status}";
                          String Payment_Complete = "${e.Payment_Complete}";
                          // String Deals_photo = "${e.Deals_photo}";

                          if (coupon_Status == "Used") {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: activeCouponDeal(
                                          couponID: couponId,
                                          DealTitle: Deals_title,
                                          DealTime: Deals_applicable_time,
                                          DealDay: Deals_applicable_day,
                                          DealExpire: Deals_expiry_date,
                                          DealDiscount: Deals_discount,
                                          CouponPrice: Total_coupon_price,
                                          CustomerName: CustomerName,
                                          CustomerEmail: CustomerEmail,
                                          CustomerPhone: CustomerPhone,
                                          CustomerAddress: CustomerLocation,
                                          BusinessName: Business_name,
                                          BusinessLocation: Business_location,
                                          BusinessContact: Business_Phone)));
                                },
                                child: smallContainer(
                                  dealTitle: Deals_title,
                                  businessName: Business_name,
                                  discount: Deals_discount,
                                  frontLabel: "Status",
                                  newLabel: coupon_Status,
                                  discountColor: Colours.errorColor,
                                  smallboxWidght: 0.26,
                                  couponID: couponId,
                                ));
                          } else {
                            return Container();
                          }
                        }).toList()),
                      ),
                    ],
                  );
                }
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: Lottie.asset(
                        'assets/lottie/noDealsFound.json',
                        height: 200.h,
                        width: 200.w,
                      ),
                    ),
                    LargeText(
                      text: "No Deals In Cart",
                      size: 18,
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
