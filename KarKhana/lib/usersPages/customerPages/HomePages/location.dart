// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:karkhana/API/auth_api.dart';
import 'package:karkhana/Packages/Packages.dart';

class askLocation extends StatefulWidget {
  const askLocation({super.key});

  @override
  State<askLocation> createState() => _askLocationState();
}

class _askLocationState extends State<askLocation> {
  late String lat;
  late String lon;
  String currentLocation = "";

  Future<Position> getCurrentLocationUser() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanently denied, we cannot request');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getUserAddress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // ignore: avoid_print
    print(placemarks);

    // ignore: unused_local_variable
    Placemark place = placemarks[0];

    currentLocation = '${place.locality}';
    // "${place.locality}, ${place.subAdministrativeArea},${place.administrativeArea},${place.country},${place.isoCountryCode}";
    setState(() {});
    var box = await Hive.openBox(tokenBox);
    var keybox = box.get("token");
    await addLocation(keybox, currentLocation);
    Navigator.of(context).pushReplacement(PageTransition(
      type: PageTransitionType.bottomToTop,
      child: btmNavigationBar(),
    ));
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => LoadingSplashScreen2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colours.backgroundColor,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Column(
            children: [
              Center(
                child: Lottie.asset('assets/lottie/location.json',
                    height: 160.h, width: 320.w),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(
                      text: "Set Your Location",
                      size: 28,
                      color: Colours.secondaryColor,
                    ),
                    smallText(
                      text:
                          "By sharing your location you can find nearby offers and deals more easily",
                      overFlow: TextOverflow.visible,
                      maxline: 2,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ButtonContainerIcon(
                      butborderColor: Colours.secondaryColor,
                      text: "Use my location",
                      butColor: Colours.secondaryColor,
                      onClick: () async {
                        Position position = await getCurrentLocationUser();
                        // locationMessage =
                        //     'Latitude of Place:${position.latitude}, Longitude of Place:${position.longitude}';
                        getUserAddress(position);
                        setState(() {});
                      },
                      icon: Icons.my_location_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
