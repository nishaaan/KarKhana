// ignore_for_file: must_be_immutable, file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:karkhana/Packages/Packages.dart';

class SplashScreen extends StatefulWidget {
  Widget page;
  SplashScreen({super.key, required this.page});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/lottie/loading.json',
          height: 100.h, width: 180.w),
      nextScreen: widget.page,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
