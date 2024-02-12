// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_build_context_synchronously, prefer_const_constructors

import 'package:karkhana/Packages/Packages.dart';

class UserSettings extends StatefulWidget {
  UserSettings({
    super.key,
  });

  @override
  State<UserSettings> createState() => UserSettingsState();
}

class UserSettingsState extends State<UserSettings> {
  //GoogleSignInAccount user = GoogleSignInAccount;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Material(
                      elevation: 8,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/user.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "${user.name}",
                style: GoogleFonts.poppins(
                  color: Colours.textColor2,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              TextButtons(
                  label: "Edit Profile",
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colours.secondaryColor,
                  ),
                  onClick: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: EditProfile(),
                    ));
                  }),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "About Us",
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colours.secondaryColor,
                  ),
                  onClick: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: AboutUs(),
                    ));
                  }),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "Send Feedback",
                  icon: const Icon(
                    Icons.mail_outline_outlined,
                    color: Colours.secondaryColor,
                  ),
                  onClick: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SendFeedback(),
                    ));
                  }),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "Contact Us",
                  icon: const Icon(
                    Icons.phone_outlined,
                    color: Colours.secondaryColor,
                  ),
                  onClick: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ContactUs(),
                    ));
                  }),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "Log out",
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colours.secondaryColor,
                  ),
                  onClick: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Log out'),
                              content: const Text(
                                  'Are you sure you want to Log out?'),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      User user =
                                          context.read<UserCubit>().state;
                                      await logOutUser(user.token!);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              backgroundColor:
                                                  Colours.errorColor,
                                              content: Text(
                                                "Logged Out",
                                                textAlign: TextAlign.center,
                                              )));

                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WelcomeScreen(),
                                          ),
                                          (route) => false);
                                    },
                                    child: const Text('Yes')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('NO'))
                              ],
                            ));
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
