// ignore_for_file: use_build_context_synchronously, prefer_final_fields, non_constant_identifier_names, unused_import, prefer_const_constructors

import 'package:karkhana/Packages/Packages.dart';
import 'dart:io';

import 'package:karkhana/usersPages/customerPages/HomePages/splashscreen.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _UserName = TextEditingController();
  TextEditingController _UserEmail = TextEditingController();
  TextEditingController _UserPw = TextEditingController();
  TextEditingController _UserPwConfirm = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _UserEmail;
    _UserName;
    _UserPw;
    _UserPwConfirm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colours.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color:
                                              Colors.blue), //apply style to all
                                      children: [
                                    TextSpan(
                                      text: 'Kar',
                                      style: GoogleFonts.poppins(
                                        color: Colours.textColor,
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'Khana',
                                        style: GoogleFonts.poppins(
                                          color: Colours.secondaryColor,
                                          fontSize: 40.sp,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.none,
                                        )),
                                  ])),
                              smallText(
                                text: "Registration",
                                size: 16,
                                color: Colours.secondaryColor,
                              )
                            ],
                          ),
                        ),
                        Center(
                            child: Column(
                          children: [
                            Lottie.asset('assets/lottie/getDiscount.json',
                                height: 180.h, width: 350.w),
                            smallText(
                              text: "Be a member and get your best deals here!",
                              size: 14,
                            )
                          ],
                        )),
                        SizedBox(height: 25.h),
                        NtextField(
                            controller: _UserName,
                            name: 'Name',
                            prefix: const Icon(Icons.person_outline),
                            validator: ValidationOfFields.valName),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserEmail,
                          name: 'Email',
                          prefix: const Icon(Icons.mail_outline),
                          validator: ValidationOfFields.valEmail,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserPw,
                          name: 'Password',
                          obsecure: true,
                          prefix: const Icon(Icons.lock_outline),
                          isPassword: true,
                          validator: ValidationOfFields.valPassword,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserPwConfirm,
                          name: 'Confirm Password',
                          obsecure: true,
                          prefix: const Icon(Icons.lock_outline),
                          isPassword: true,
                          validator: ValidationOfFields.valPassword,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        ButtonContainer(
                          butborderColor: Colours.secondaryColor,
                          text: 'Signup',
                          butColor: Colours.secondaryColor,
                          onClick: () async {
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
                              var authResponse = await registerUser(
                                _UserName.text,
                                _UserEmail.text,
                                _UserPw.text,
                                _UserPwConfirm.text,
                              );

                              if (authResponse.runtimeType == String) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text('Invalid Input'),
                                          content: Text(
                                            authResponse,
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return LoadingSplashScreen();
                                  }),
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an Account? ",
                              style: TextStyle(
                                  color: Colours.greyColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'ProximaNova',
                                  decoration: TextDecoration.none),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return UserLoginPage();
                                  }),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colours.borderColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'ProximaNova',
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _UserName.dispose();
    _UserEmail.dispose();
    _UserPw.dispose();
    _UserPwConfirm.dispose();
    super.dispose();
  }
}
