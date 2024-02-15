// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:karkhana/Packages/Packages.dart';

class CategorySwimming extends StatefulWidget {
  const CategorySwimming({super.key});

  @override
  State<CategorySwimming> createState() => _CategorySwimmingState();
}

class _CategorySwimmingState extends State<CategorySwimming> {
  FetchCategoryDeals category = FetchCategoryDeals();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: LargeText(
                      text: "Swimming Deals",
                      size: 30,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
                future: category.getCategoryDeals(query: "Swimming Deals"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.hasData && snapshot.data!.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Column(
                            children: [
                              Lottie.asset(
                                "assets/lottie/noDealsFound.json",
                                height: 180,
                                width: 250,
                              ),
                              LargeText(
                                text: "No Deals of this Category!",
                                size: 18,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: Column(
                                  children: snapshot.data.map<Widget>((e) {
                                String VendorBusiness_Name =
                                    "${e.Business_name}";
                                String VendorBusiness_Location =
                                    "${e.Business_location}";
                                // String VendorBusiness_Image =
                                //     "${e.Business_photo}";
                                String Deals_Title = "${e.Deals_title}";
                                String Deals_Photo = "${e.Deals_photo}";
                                int Deals_Price = e.Deals_price;
                                String Deals_Desc = "${e.Deals_desc}";
                                String Deals_category = "${e.Deals_category}";
                                String Deals_condition = "${e.Deals_condition}";
                                int Deals_Discount = e.Deals_discount;
                                String Deals_applicable_time =
                                    "${e.Deals_applicable_time}";
                                String Deals_applicable_day =
                                    "${e.Deals_applicable_day}";
                                String Deals_expiry_date =
                                    "${e.Deals_expiry_date}";
                                int Deal_user = e.Deals_user;
                                String Vendor_Phone = "${e.Business_Phone}";
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageTransition(
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        child: scrollDealdetail(
                                            VendorBusinessName:
                                                VendorBusiness_Name,
                                            VendorBusinessLocation:
                                                VendorBusiness_Location,
                                            Business_Phone: Vendor_Phone,
                                            // VendorBusinessPhoto:
                                            //     VendorBusiness_Image,
                                            Deals_Title: Deals_Title,
                                            Deals_Price: Deals_Price,
                                            Deals_Photo: Deals_Photo,
                                            Deals_Desc: Deals_Desc,
                                            Deals_category: Deals_category,
                                            Deals_condition: Deals_condition,
                                            Deals_Discount: Deals_Discount,
                                            Deals_applicable_time:
                                                Deals_applicable_time,
                                            Deals_applicable_day:
                                                Deals_applicable_day,
                                            Deals_expiry_date:
                                                Deals_expiry_date,
                                            Deal_user: Deal_user)));
                                  },
                                  child: HomeDealContainer(
                                    VendorBusiness_Name: VendorBusiness_Name,
                                    VendorBusiness_Location:
                                        VendorBusiness_Location,
                                    Business_Phone: Vendor_Phone,
                                    // VendorBusiness_Photo:
                                    //     VendorBusiness_Image,
                                    Deals_Title: Deals_Title,
                                    Deals_Price: Deals_Price,
                                    Deals_Photo: Deals_Photo,
                                    Deals_Desc: Deals_Desc,
                                    Deals_category: Deals_category,
                                    Deals_condition: Deals_condition,
                                    Deals_Discount: Deals_Discount,
                                    Deals_applicable_time:
                                        Deals_applicable_time,
                                    Deals_applicable_day: Deals_applicable_day,
                                    Deals_expiry_date: Deals_expiry_date,
                                    Deal_user: Deal_user,
                                  ),
                                );
                              }).toList()),
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        );
                      }
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Lottie.asset(
                              "assets/lottie/search_empty.json",
                            ),
                            LargeText(
                              text: "No Deals Found!",
                            ),
                            LargeText(text: "Search Other Deals."),
                          ],
                        ),
                      );
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}
