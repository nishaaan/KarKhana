// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:karkhana/Packages/Packages.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertset = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertset == false) {
          showDialogBox();
          setState(() => isAlertset = true);
        }
      });

  showDialogBox() => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('No Connection'),
            content: const Text('Please check your internet connectivity'),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context, 'Cancel');
                    setState(() {
                      isAlertset = false;
                    });
                    isDeviceConnected =
                        await InternetConnectionChecker().hasConnection;
                    if (!isDeviceConnected) {
                      showDialogBox();
                      setState(() {
                        isAlertset = true;
                      });
                    }
                  },
                  child: const Text('OK'))
            ],
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                "assets/images/logomain.png",
                height: 120.h,
                width: 215.w,
              ),
              Align(
                  alignment: Alignment.center,
                  child: LargeText(
                    text: "WELCOME TO KarKhana",
                    color: Colours.secondaryColor,
                    size: 24,
                  )),
              Align(
                child: smallText(
                  text: "Are you here as customer or a vendor?",
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Lottie.asset('assets/lottie/welcome.json',
                    height: 280.h, width: 290.w),
              ),
              SizedBox(
                height: 20.h,
              ),
              ButtonContainer(
                text: 'Login as Customer',
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserLoginPage()));
                },
                butColor: Colours.textColor,
                butborderColor: Colours.textColor,
              ),
              SizedBox(
                height: 15.h,
              ),
              ButtonContainer(
                text: 'Login as Vendor',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VendorLoginPage()));
                },
                butColor: Colours.secondaryColor,
                butborderColor: Colours.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
