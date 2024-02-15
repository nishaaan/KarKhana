// ignore_for_file: file_names, must_be_immutable, camel_case_types, non_constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_string_interpolations, avoid_print

import 'dart:io';

import 'package:karkhana/Packages/Packages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class activeCouponDeal extends StatefulWidget {
  int couponID;
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
  bool isActiveisCustomer;
  activeCouponDeal({
    super.key,
    required this.couponID,
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
    this.isActiveisCustomer = false,
  });

  @override
  State<activeCouponDeal> createState() => _activeCouponDealState();
}

class _activeCouponDealState extends State<activeCouponDeal> {
  final _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
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
                Screenshot(
                  controller: _screenshotController,
                  child: Padding(
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    LargeText(
                                      text: "Coupon ID: ${widget.couponID}",
                                      color: Colours.secondaryColor,
                                    ),
                                    widget.isActiveisCustomer
                                        ? GestureDetector(
                                            onTap: _takeScreenshot,
                                            child: const Icon(
                                              Icons.share_outlined,
                                              color: Colours.greenColor,
                                            ))
                                        : const Text(""),
                                  ],
                                ),
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
                                        smallText(
                                            text: "Deal Applicable Time: "),
                                        smallText(text: "${widget.DealTime}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        smallText(
                                            text: "Deal Applicable Day: "),
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
                                        smallText(
                                            text: "${widget.DealDiscount}%")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        smallText(text: "Coupon Price: "),
                                        smallText(
                                            text: "Rs${widget.CouponPrice}")
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
                                        smallText(
                                            text: "${widget.CustomerName}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        smallText(text: "Customer Email:"),
                                        smallText(
                                            text: "${widget.CustomerEmail}")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        smallText(text: "Customer Phone:"),
                                        smallText(
                                            text: "${widget.CustomerPhone}")
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
                                        smallText(
                                            text: "${widget.BusinessName}")
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
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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

  void _takeScreenshot() async {
    final uint8List = await _screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    await file.writeAsBytes(uint8List!);
    XFile xFile = XFile(file.path, name: 'image.png', mimeType: 'image/png');
    // XFile.fromData(file.readAsBytesSync(), name: 'image.png');
    try {
      await Share.shareXFiles([xFile]);
    } catch (e) {
      print("Sharing failed: $e");
    }
  }
}
