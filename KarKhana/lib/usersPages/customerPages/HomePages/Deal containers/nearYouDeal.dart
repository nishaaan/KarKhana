// ignore_for_file: must_be_immutable, non_constant_identifier_names, file_names, use_key_in_widget_constructors, avoid_types_as_parameter_names, unnecessary_string_interpolations, prefer_const_constructors

import 'package:karkhana/Packages/Packages.dart';

class NearYouDeals extends StatefulWidget {
  final String? VendorBusiness_Name;
  final String? VendorBusiness_Location;
  // final String? VendorBusiness_Photo;
  String? Business_Phone;
  String Deals_Title;
  int Deals_Price;
  String Deals_Photo;
  String Deals_Desc;
  String Deals_category;
  String Deals_condition;
  int Deals_Discount;
  String Deals_applicable_time;
  String Deals_applicable_day;
  String Deals_expiry_date;
  int Deal_user;

  NearYouDeals({
    Key,
    key,
    this.VendorBusiness_Name,
    this.VendorBusiness_Location,
    // this.VendorBusiness_Photo,
    this.Business_Phone,
    required this.Deals_Price,
    required this.Deals_Title,
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
  State<NearYouDeals> createState() => _NearYouDealsState();
}

class _NearYouDealsState extends State<NearYouDeals> {
  @override
  Widget build(BuildContext context) {
    String photo = widget.Deals_Photo;
    return Column(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height * 0.34).h,
          width: (MediaQuery.of(context).size.width * 0.8).w,
          decoration: BoxDecoration(
            color: Colours.backgroundColor,
            borderRadius: BorderRadius.circular(20),
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
            padding: const EdgeInsets.all(14.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: LargeText(
                                text: "${widget.VendorBusiness_Name}")),
                        smallText(text: "${widget.VendorBusiness_Location}")
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: (MediaQuery.of(context).size.height * 0.14).h,
                width: (MediaQuery.of(context).size.width * 0.9).w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(photo),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: LargeText(
                  text: "${widget.Deals_Title}",
                  maxline: 2,
                  size: 17,
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height * 0.04).h,
                width: (MediaQuery.of(context).size.width * 0.2).w,
                color: Colours.greenColor,
                child: Center(
                  child: LargeText(
                    text: "${widget.Deals_Discount}" + "%OFF",
                    color: Color.fromARGB(255, 43, 140, 93),
                    size: 16,
                  ),
                ),
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
