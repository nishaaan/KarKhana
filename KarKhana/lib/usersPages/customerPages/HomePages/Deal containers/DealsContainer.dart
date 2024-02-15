// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, avoid_types_as_parameter_names, unnecessary_string_interpolations, prefer_const_constructors, prefer_adjacent_string_concatenation

import 'package:karkhana/Packages/Packages.dart';

class HomeDealContainer extends StatefulWidget {
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

  HomeDealContainer({
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
  State<HomeDealContainer> createState() => _HomeDealContainerState();
}

class _HomeDealContainerState extends State<HomeDealContainer> {
  @override
  Widget build(BuildContext context) {
    String photo = widget.Deals_Photo;
    return Column(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height * 0.54).h,
          width: (MediaQuery.of(context).size.width * 0.9).w,
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
            padding: const EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("assets/images/businessprofile.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                height: (MediaQuery.of(context).size.height * 0.2).h,
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
                  size: 18,
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
              Padding(
                padding: EdgeInsets.only(
                  top: 8.h,
                  left: 8.w,
                  right: 8.w,
                ),
                child: ButtonContainer(
                    butborderColor: Colours.greyColor,
                    text: "View Details",
                    textColor: Colours.textColor,
                    butColor: Colours.backgroundColor,
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scrollDealdetail(
                                  VendorBusinessName:
                                      "${widget.VendorBusiness_Name}",
                                  VendorBusinessLocation:
                                      "${widget.VendorBusiness_Location}",
                                  Business_Phone: "${widget.Business_Phone}",
                                  // VendorBusinessPhoto:
                                  //     "${widget.VendorBusiness_Photo}",
                                  Deals_Title: widget.Deals_Title,
                                  Deals_Price: widget.Deals_Price,
                                  Deals_Photo: widget.Deals_Photo,
                                  Deals_Desc: widget.Deals_Desc,
                                  Deals_category: widget.Deals_category,
                                  Deals_condition: widget.Deals_condition,
                                  Deals_Discount: widget.Deals_Discount,
                                  Deals_applicable_time:
                                      widget.Deals_applicable_time,
                                  Deals_applicable_day:
                                      widget.Deals_applicable_day,
                                  Deals_expiry_date: widget.Deals_expiry_date,
                                  Deal_user: widget.Deal_user)));
                    }),
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
