// ignore_for_file: file_names, must_be_immutable, camel_case_types, non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:karkhana/Packages/Packages.dart';
import 'package:karkhana/usersPages/vendorPages/HomeScreens/VendorPurchases/Vpurchases.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class activeVendorCoupon extends StatefulWidget {
  int couponID;
  int customerID;
  int vendorID;
  String DealTitle;
  String DealTime;
  String DealDay;
  String DealExpire;
  int DealDiscount;
  int CouponPrice;
  String CustomerName;
  String CustomerEmail;
  String CustomerPhone;
  String CustomerAddress;
  String BusinessName;
  String BusinessLocation;
  String BusinessContact;
  activeVendorCoupon({
    super.key,
    required this.couponID,
    required this.customerID,
    required this.vendorID,
    required this.DealTitle,
    required this.DealTime,
    required this.DealDay,
    required this.DealExpire,
    required this.DealDiscount,
    required this.CouponPrice,
    required this.CustomerName,
    required this.CustomerEmail,
    required this.CustomerPhone,
    required this.CustomerAddress,
    required this.BusinessName,
    required this.BusinessLocation,
    required this.BusinessContact,
  });

  @override
  State<activeVendorCoupon> createState() => _activeVendorCouponState();
}

class _activeVendorCouponState extends State<activeVendorCoupon> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;

    // API
    Future<dynamic> confirmPurchase(
      int id,
      int customer,
      int vendor,
      String status,
      String Email,
      String Message,
    ) async {
      String ID = id.toString();
      String CustomerID = customer.toString();
      String VendorID = vendor.toString();
      Map body = {
        "Customer_User": CustomerID,
        "Vendor_User": VendorID,
        "coupon_Status": status,
      };
      var url = Uri.parse("$baseUrl/accounts/Coupon/$ID");
      var res = await http.put(url, body: body);

      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 200 || res.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "The coupon has been confirmed",
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white);

        GetCouponDetails(vendor);
        sendPurchaseEmail(Message, Email);

        setState(() {});
      } else {
        Fluttertoast.showToast(
            msg: "Sorry! Something went wrong",
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white);
        print("Sorry");
      }
    }

    //UI
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    LargeText(
                      text: "Coupon Details",
                      color: Colours.secondaryColor,
                      size: 25,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Colours.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.1,
                          blurRadius: 1.1,
                          // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: LargeText(
                                text: "Coupon ID: ${widget.couponID}",
                                color: Colours.secondaryColor,
                              )),
                              SizedBox(
                                height: 10.h,
                              ),
                              LargeText(text: "Deal Details"),
                              const Divider(
                                height: 1,
                                thickness: 1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Deal Title: "),
                                      smallText(text: "${widget.DealTitle}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Deal Applicable Time: "),
                                      smallText(text: "${widget.DealTime}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Deal Applicable Day: "),
                                      smallText(text: "${widget.DealDay}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Deal Expiry Date: "),
                                      smallText(text: "${widget.DealExpire}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Deal Discount: "),
                                      smallText(text: "${widget.DealDiscount}%")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Coupon Price: "),
                                      smallText(text: "Rs${widget.CouponPrice}")
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              LargeText(text: "Customer Details"),
                              const Divider(
                                height: 1,
                                thickness: 1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Customer Name:"),
                                      smallText(text: "${widget.CustomerName}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Customer Email:"),
                                      smallText(text: "${widget.CustomerEmail}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Customer Phone:"),
                                      smallText(text: "${widget.CustomerPhone}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Customer Address:"),
                                      smallText(
                                          text: "${widget.CustomerAddress}")
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              LargeText(text: "Vendor Details"),
                              const Divider(
                                height: 1,
                                thickness: 1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Business Name:"),
                                      smallText(text: "${widget.BusinessName}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Business Location:"),
                                      smallText(
                                          text: "${widget.BusinessLocation}")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      smallText(text: "Contact:"),
                                      smallText(
                                          text: "${widget.BusinessContact}")
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  ButtonContainer(
                                      butborderColor: Colours.secondaryColor,
                                      text: "Confirm Coupon",
                                      butColor: Colours.secondaryColor,
                                      onClick: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: const Text(
                                                      'Confirm Coupon Purchase'),
                                                  content: const Text(
                                                      'Are you sure you want to Confirm this purchase?'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          confirmPurchase(
                                                            widget.couponID,
                                                            widget.customerID,
                                                            widget.vendorID,
                                                            "Used",
                                                            widget
                                                                .CustomerEmail,
                                                            "Your Coupon for deal " +
                                                                "${widget.DealTitle}" +
                                                                " has been used.",
                                                          );
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                            PageTransition(
                                                              type: PageTransitionType
                                                                  .bottomToTop,
                                                              child:
                                                                  VendorDealPurchased(),
                                                            ),
                                                          );
                                                        },
                                                        child: const Text(
                                                            'Confirm')),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text('Close'))
                                                  ],
                                                ));
                                      })
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
