// ignore_for_file: file_names, camel_case_types, must_be_immutable, unnecessary_string_interpolations, prefer_adjacent_string_concatenation

import 'package:karkhana/Packages/Packages.dart';

class smallContainer extends StatefulWidget {
  String dealTitle;
  String businessName;
  int? discount;
  String frontLabel;
  String newLabel;
  Color? smallboxColor;
  Color? discountColor;
  double smallboxWidght;
  int? couponID;
  bool iscart;

  smallContainer({
    super.key,
    required this.dealTitle,
    required this.businessName,
    required this.discount,
    required this.frontLabel,
    required this.newLabel,
    this.smallboxColor = Colours.errorColor,
    this.discountColor = Colours.greenColor,
    required this.smallboxWidght,
    this.couponID,
    this.iscart = false,
  });

  @override
  State<smallContainer> createState() => _smallContainerState();
}

class _smallContainerState extends State<smallContainer> {
  GlobalKey containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Container(
            height: (height * 0.17).h,
            width: (width * 0.8).w,
            decoration: BoxDecoration(
              color: Colours.backgroundColor,
              borderRadius: BorderRadius.circular(20),
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
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.iscart
                          ? const Text("")
                          : LargeText(
                              text: "Coupon ID: " + "${widget.couponID}",
                              size: 14,
                              color: Colours.greyColor,
                            ),
                      LargeText(
                        text: "${widget.dealTitle}",
                        maxline: 1,
                        size: 14,
                      ),
                      smallText(text: "By " + "${widget.businessName}"),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: widget.smallboxColor,
                            borderRadius: BorderRadius.circular(9.7)),
                        height: (MediaQuery.of(context).size.height * 0.03).h,
                        width: (MediaQuery.of(context).size.width *
                                widget.smallboxWidght)
                            .w,
                        child: Center(
                          child: smallText(
                            text:
                                "${widget.frontLabel}: " + "${widget.newLabel}",
                            color: Colours.backgroundColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Column(
                    children: [
                      LargeText(
                        text: "${widget.discount}" + "%",
                        color: widget.discountColor,
                        size: 30,
                      ),
                      LargeText(
                        text: "discount",
                        size: 12,
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
