// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables, unnecessary_new, non_constant_identifier_names, prefer_final_fields, avoid_print, prefer_const_constructors, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:karkhana/Packages/Packages.dart';

class UserLoginPage extends StatefulWidget {
  UserLoginPage({
    super.key,
  });

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController _UserEmail = new TextEditingController();
  TextEditingController _UserPw = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Future signIn() async {
    try {
      final user = await GoogleSignInApi.login();

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1000),
            content: Text('Sign in Failed')));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => askLocation()));
      }
    } on PlatformException catch (e) {
      print("Platform Exception $e");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 1000),
          content: Text('Something went wrong')));
      print("Error is $e");
    }
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
        resizeToAvoidBottomInset: false,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: SvgPicture.asset(
                                "assets/images/logo.svg",
                                height: 90.h,
                                width: 90.w,
                              ),
                            ),
                            Column(
                              children: [
                                LargeText(
                                  text: "Log in to",
                                ),
                                Center(
                                    child: Row(
                                  children: [
                                    LargeText(
                                      text: "Kar ",
                                      size: 24,
                                    ),
                                    LargeText(
                                      text: "Khana",
                                      color: Colours.secondaryColor,
                                      size: 24,
                                    )
                                  ],
                                )),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        NtextField(
                          controller: _UserEmail,
                          name: 'Email',
                          prefix: const Icon(Icons.person_outline),
                          validator: ValidationOfFields.valEmail,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        NtextField(
                          controller: _UserPw,
                          name: 'Password',
                          obsecure: true,
                          isPassword: true,
                          prefix: const Icon(Icons.lock_outline),
                          validator: ValidationOfFields.valPassword,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        GestureDetector(
                          child: smallText(
                            text: "Forget Password?",
                            decoration: TextDecoration.underline,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50.0),
                                ),
                              ),
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return SizedBox(
                                  height: 400.h,
                                  child: ForgetPassword(),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                        ButtonContainer(
                          text: 'Login',
                          onClick: () async {
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
                              var authResponse =
                                  await userAuth(_UserEmail.text, _UserPw.text);
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
                              } else if (authResponse.runtimeType == User) {
                                User user = authResponse;
                                context.read<UserCubit>().emit(user);
                                if (user.is_user == 1) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                            "Logged in",
                                            textAlign: TextAlign.center,
                                          )));
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => askLocation()));
                                } else {
                                  await logOutUser(user.token!);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text('Invalid Input'),
                                            content: const Text(
                                                'Unable to log in with provided credentials.'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Close')),
                                            ],
                                          ));
                                }
                              }
                            }
                          },
                          butColor: Colours.secondaryColor,
                          butborderColor: Colours.secondaryColor,
                        ),
                        SizedBox(
                          height: 60.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Row(
                              children: [
                                const Flexible(
                                  flex: 1,
                                  child: Divider(
                                    color: Colours.smallColor,
                                    thickness: 0.5,
                                    height: 0,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: smallText(
                                      text: 'or',
                                      size: 17.sp,
                                    ),
                                  ),
                                ),
                                const Flexible(
                                  flex: 1,
                                  child: Divider(
                                    color: Colours.smallColor,
                                    thickness: 0.5,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        googleButton(
                          image: "assets/images/google.svg",
                          text: 'Login with Google',
                          butColor: Colours.textColor,
                          onClick: signIn,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            smallText(
                              text: "Don't have an Account? ",
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: UserSignUp(),
                                  ));
                                },
                                child: smallText(
                                  text: "Register",
                                  color: Colours.borderColor,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
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
    _UserEmail.dispose();
    _UserPw.dispose();

    super.dispose();
  }
}
