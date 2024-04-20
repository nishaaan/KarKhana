// ignore_for_file: file_names, unused_import, prefer_final_fields, unused_field, unnecessary_new, avoid_print, non_constant_identifier_names, prefer_const_declarations, prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:karkhana/Packages/Packages.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class VendorAddDeals extends StatefulWidget {
  const VendorAddDeals({super.key});

  @override
  State<VendorAddDeals> createState() => _VendorAddDealsState();
}

class _VendorAddDealsState extends State<VendorAddDeals> {
  TextEditingController _dealtitle = TextEditingController();
  TextEditingController _dealphoto = TextEditingController();
  TextEditingController _dealcategory = TextEditingController();
  TextEditingController _dealdesc = TextEditingController();
  TextEditingController _dealcondition = TextEditingController();
  TextEditingController _dealdiscount = TextEditingController();
  TextEditingController _dealprice = TextEditingController();
  TextEditingController _dealapplicabletime = TextEditingController();
  TextEditingController _dealapplicableday = TextEditingController();
  TextEditingController _dealexpirydate = TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    String BusinessName = user.name!;
    String BusinessLocation = user.location!;
    String BusinessPhone = user.phonenumber!;
    int pk = user.id!;

    Future<void> postDeals(
      String businessName,
      String businessLocation,
      String dealTitle,
      String BusinessPhone,
      int price,
      String dealCategory,
      String dealDescription,
      String dealCondition,
      int discount,
      String dealApplicableTime,
      String dealApplicableDay,
      String dealExpiryDate,
      int pk,
      File? image,
    ) async {
      final url = '$baseUrl/accounts/deals/';
      String PK = pk.toString();
      final request = http.MultipartRequest('POST', Uri.parse(url));

      // Add image file to the request
      if (image != null) {
        final imageField = await http.MultipartFile.fromPath(
          'deal_photo',
          image.path,
        );
        request.files.add(imageField);
      }

      // Add other fields to the request
      request.fields['BusinessName'] = businessName;
      request.fields['BusinessLocation'] = businessLocation;
      request.fields['Business_Phone'] = BusinessPhone;
      request.fields['deal_title'] = dealTitle;
      request.fields['deal_price'] = price.toString();
      request.fields['deal_category'] = dealCategory;
      request.fields['deal_desc'] = dealDescription;
      request.fields['deal_condition'] = dealCondition;
      request.fields['deal_discount'] = discount.toString();
      request.fields['deal_applicable_time'] = dealApplicableTime;
      request.fields['deal_applicable_day'] = dealApplicableDay;
      request.fields['deal_expiry_date'] = dealExpiryDate;
      request.fields['user'] = PK;

      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          _dealtitle.clear();
          _dealprice.clear();
          _dealcategory.clear();
          _dealdesc.clear();
          _dealcondition.clear();
          _dealdiscount.clear();
          _dealapplicabletime.clear();
          _dealapplicableday.clear();
          _dealexpirydate.clear();
        });
        // ignore: use_build_context_synchronously
        return showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: LargeText(text: 'Deal Success'),
                  content: const Text(
                    "Deal has been successfully added in KarKhana system.",
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'))
                  ],
                ));
      } else {
        // ignore: use_build_context_synchronously
        return showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: LargeText(text: 'Deal Failed'),
                  content: const Text(
                    "Deal was not added into KarKhana system as you have not uploaded your profile. Upload your business profile first.",
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'))
                  ],
                ));
      }
    }

    // Future<dynamic> postDeals(
    //   String BusinessName,
    //   String BusinessLocation,
    //   String deal_Title,
    //   int deal_price,
    //   String deal_category,
    //   String deal_desc,
    //   String deal_condition,
    //   int deal_discount,
    //   String deal_applicable_time,
    //   String deal_applicable_day,
    //   String deal_expiry_date,
    //   int user,
    //   File? image,
    // ) async {
    //   var url = Uri.parse("$baseUrl/accounts/deals/");
    //   var res = await http.post(url,
    //       headers: <String, String>{
    //         'Content-Type': 'application/json; charset=UTF-8',
    //       },
    //       body: jsonEncode(<String, dynamic>{
    //         "BusinessName": BusinessName,
    //         "BusinessLocation": BusinessLocation,
    //         "Business_Phone": BusinessPhone,
    //         "deal_title": deal_Title,
    //         "deal_photo": image,
    //         "deal_price": deal_price,
    //         "deal_category": deal_category,
    //         "deal_desc": deal_desc,
    //         "deal_condition": deal_condition,
    //         "deal_discount": deal_discount,
    //         "deal_applicable_time": deal_applicable_time,
    //         "deal_applicable_day": deal_applicable_day,
    //         "deal_expiry_date": deal_expiry_date,
    //         "user": user,
    //       }));
    //   if (res.statusCode == 200 || res.statusCode == 201) {
    //     setState(() {
    //       _dealtitle.clear();
    //       _dealprice.clear();
    //       _dealcategory.clear();
    //       _dealdesc.clear();
    //       _dealcondition.clear();
    //       _dealdiscount.clear();
    //       _dealapplicabletime.clear();
    //       _dealapplicableday.clear();
    //       _dealexpirydate.clear();
    //     });
    //     // ignore: use_build_context_synchronously
    //     return showDialog(
    //         context: context,
    //         builder: (BuildContext context) => AlertDialog(
    //               title: LargeText(text: 'Deal Success'),
    //               content: const Text(
    //                 "Deal has been successfully added in BriskDeals system.",
    //               ),
    //               actions: [
    //                 TextButton(
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     child: const Text('Close'))
    //               ],
    //             ));
    //   } else {
    //     // ignore: use_build_context_synchronously
    //     return showDialog(
    //         context: context,
    //         builder: (BuildContext context) => AlertDialog(
    //               title: LargeText(text: 'Deal Failed'),
    //               content: const Text(
    //                 "Deal was not added into KarKhana system as you have not uploaded your profile. Upload your business profile first.",
    //               ),
    //               actions: [
    //                 TextButton(
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     child: const Text('Close'))
    //               ],
    //             ));
    //   }
    // }

    // Category list
    List<String> categories = [
      "Swimming Deals",
      "Food Deals",
      "Car Service Deals",
      "Health Deals",
      "Cosmetic Deals",
      "Event Deals",
    ];

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                  child: Row(
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
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: LargeText(
                            text: "Add Your Deals",
                            size: 25,
                          ),
                        ),
                        LottieBuilder.asset(
                          "assets/lottie/adddeals.json",
                          height: 180.h,
                          width: 300.w,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                            controller: _dealtitle,
                            name: "Deal title",
                            validator: ValidationOfFields.valField),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colours.textColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colours.backgroundColor.withOpacity(0.5),
                                spreadRadius: 1.1,
                                blurRadius: 1.1,
                                // changes position of shadow
                              ),
                            ],
                          ),
                          child: DropDownField(
                            controller: _dealcategory,
                            hintText: "Select Category",
                            items: categories,
                            textStyle: GoogleFonts.lato(
                              color: Colours.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            image != null
                                ? Image.file(
                                    image!,
                                    width: 150,
                                    height: 150,
                                  )
                                : Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      // Replace Colors.blue with the desired background color
                                      border: Border.all(
                                        color: Colours
                                            .greyColor, // Replace Colors.black with the desired border color
                                        width:
                                            2.0, // Replace 2.0 with the desired border width
                                      ),
                                    ),
                                    child: Center(
                                        child: smallText(text: "Your Image"))),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  pickImage();
                                },
                                child: Container(
                                  width: 140.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colours.secondaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.image_outlined,
                                        color: Colours.backgroundColor,
                                      ),
                                      smallText(
                                        text: "Pick your Image",
                                        color: Colours.backgroundColor,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                          controller: _dealdesc,
                          name: "Deal describtion",
                          validator: ValidationOfFields.valField,
                          needArea: true,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                          controller: _dealcondition,
                          name: "Deal condition",
                          validator: ValidationOfFields.valField,
                          needArea: true,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                            controller: _dealdiscount,
                            name: "Deal discount",
                            validator: ValidationOfFields.valField),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                            controller: _dealprice,
                            name: "Market Price of item/service",
                            validator: ValidationOfFields.valField),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                            controller: _dealapplicabletime,
                            name: "Deal applicable time",
                            validator: ValidationOfFields.valField),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                            controller: _dealapplicableday,
                            name: "Deal applicable day",
                            validator: ValidationOfFields.valField),
                        SizedBox(
                          height: 20.h,
                        ),
                        NtextField(
                          controller: _dealexpirydate,
                          name: "Deal expiry date",
                          validator: ValidationOfFields.valField,
                          ontap: () async {
                            DateTime? showDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2700));

                            if (showDate != null) {
                              setState(() {
                                _dealexpirydate.text =
                                    DateFormat('yyyy-MM-dd').format(showDate);
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ButtonContainer(
                            butborderColor: Colours.secondaryColor,
                            text: "Post Your Deal",
                            butColor: Colours.secondaryColor,
                            onClick: () {
                              final isValidForm =
                                  _formKey.currentState!.validate();

                              if (isValidForm) {
                                int price = int.parse(_dealprice.text);
                                int discount = int.parse(_dealdiscount.text);
                                postDeals(
                                  BusinessName,
                                  BusinessLocation,
                                  _dealtitle.text,
                                  BusinessPhone,
                                  price,
                                  _dealcategory.text,
                                  _dealdesc.text,
                                  _dealcondition.text,
                                  discount,
                                  _dealapplicabletime.text,
                                  _dealapplicableday.text,
                                  _dealexpirydate.text,
                                  pk,
                                  image,
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
