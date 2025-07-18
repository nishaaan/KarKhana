// ignore_for_file: file_names

//KarKhana packages
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter/src/foundation/key.dart';
export 'package:flutter/src/widgets/framework.dart';
export 'package:flutter_svg/svg.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:lottie/lottie.dart';
export 'package:page_transition/page_transition.dart';
export 'package:curved_navigation_bar/curved_navigation_bar.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:geocoding/geocoding.dart';
export 'package:geolocator/geolocator.dart';
export 'package:google_nav_bar/google_nav_bar.dart';

//KarKhana externals and models and validations
export 'package:karkhana/models/user_models.dart';
export 'package:karkhana/models/user_cubit.dart';
export 'package:karkhana/externals/colors.dart';
export 'package:karkhana/externals/largeText.dart';
export 'package:karkhana/externals/smalltext.dart';
export 'package:karkhana/externals/buttonsContainer.dart';
export 'package:karkhana/externals/ButtonContainerIcon.dart';
export 'package:karkhana/externals/smallContainer.dart';
export 'package:karkhana/externals/text_button.dart';
export 'package:karkhana/externals/googleButton.dart';
export 'package:karkhana/externals/field.dart';
export 'package:karkhana/externals/constant.dart';
export 'package:karkhana/Validations/vaidateField.dart';

//API
// export 'package:karkhana/API/auth_api.dart';
export 'package:karkhana/API/GoogleAPI.dart';

//User signin/signup pages
export 'package:karkhana/usersPages/customerPages/signIn/SignUp/sign_up.dart';
export 'package:karkhana/usersPages/customerPages/signIn/SignUp/emailconfirm.dart';
export 'package:karkhana/usersPages/customerPages/signIn/SignUp/log_in.dart';
export 'package:karkhana/usersPages/customerPages/signIn/SignUp/forgetpw.dart';

//User Screens
export 'package:karkhana/usersPages/ScreenAsk.dart';
export 'package:karkhana/usersPages/splashScreen.dart';

// Customer HomePage
export 'package:karkhana/usersPages/customerPages/HomePages/location.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/BottomNavigationbar.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/categoryContainer.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/search.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/homepage.dart';

// Settings Pages
export 'package:karkhana/usersPages/customerPages/HomePages/settings/Editprofile.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/settings/aboutus.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/settings/contactus.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/settings/feedback.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/settings/userSettings.dart';

//Deals Pages
export 'package:karkhana/usersPages/customerPages/HomePages/Deal containers/DealsContainer.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Deal containers/dealInside.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Deal containers/nearYouDeal.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Deal containers/reviewContainer.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Deal containers/reviewRating.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Deal containers/scrollDealDetail.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Deal containers/vendorDetailinside.dart';

//Cart Pages
export 'package:karkhana/usersPages/customerPages/HomePages/Cart/cart.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Cart/CartDeals.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Cart/paymentPage.dart';

//Category Pages
export 'package:karkhana/usersPages/customerPages/HomePages/Category/carService.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Category/Food.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Category/Health.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Category/swimming.dart';

//Purchases Pages
export 'package:karkhana/usersPages/customerPages/HomePages/Purchases/activeCouponDeal.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Purchases/activeCouponMain.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Purchases/previousCouponMain.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Purchases/Purchases.dart';
export 'package:karkhana/usersPages/customerPages/HomePages/Purchases/searchPurchase.dart';

//Vendor Login/Register Pages
export 'package:karkhana/usersPages/vendorPages/Login_Register/VSignup.dart';
export 'package:karkhana/usersPages/vendorPages/Login_Register/Vlogin.dart';
export 'package:karkhana/usersPages/vendorPages/Login_Register/forgetpw.dart';

//Vendor Home Screens
export 'package:karkhana/usersPages/vendorPages/HomeScreens/recentAddedDeals.dart';
export 'package:karkhana/usersPages/vendorPages/HomeScreens/recentContainer.dart';
export 'package:karkhana/usersPages/vendorPages/HomeScreens/VAddDeals.dart';
export 'package:karkhana/usersPages/vendorPages/HomeScreens/vendorSettings.dart';
export 'package:karkhana/usersPages/vendorPages/HomeScreens/Vhome.dart';

//Vendor Purchases Pages
export 'package:karkhana/usersPages/vendorPages/HomeScreens/VendorPurchases/activeVendorCoupon.dart';
export 'package:karkhana/usersPages/vendorPages/HomeScreens/VendorPurchases/activeVPurchases.dart';
export 'package:karkhana/usersPages/vendorPages/HomeScreens/VendorPurchases/searchVendorCoupon.dart';
