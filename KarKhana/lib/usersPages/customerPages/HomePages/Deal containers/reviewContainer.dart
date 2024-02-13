// ignore_for_file: file_names, unused_import, camel_case_types, must_be_immutable, non_constant_identifier_names, avoid_print

import 'dart:ffi';

import 'package:karkhana/Packages/Packages.dart';

class reviewContainer extends StatefulWidget {
  String CustomerName;
  double Rating;
  String review;

  reviewContainer({
    super.key,
    required this.CustomerName,
    required this.Rating,
    required this.review,
  });

  @override
  State<reviewContainer> createState() => _reviewContainerState();
}

class _reviewContainerState extends State<reviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h, top: 10.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // CircleAvatar(
              //   radius: 30.h,
              //   backgroundImage: AssetImage('Assets/images/Icon.png'),
              // ),
              // SizedBox(
              //   width: 15.w,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  smallText(text: widget.CustomerName),
                  SizedBox(
                    height: 5.h,
                  ),
                  RatingBar.builder(
                    initialRating: widget.Rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0.w),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 5.h,
                    ),
                    tapOnlyMode: true,
                    ignoreGestures: true,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.w, right: 20.w),
              child: smallText(text: widget.review)),
        ],
      ),
    );
  }
}
