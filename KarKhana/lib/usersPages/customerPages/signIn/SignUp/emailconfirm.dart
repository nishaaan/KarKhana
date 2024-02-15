// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, unnecessary_new, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:karkhana/Packages/Packages.dart';
import 'package:http/http.dart' as http;

class emailConfirmation extends StatefulWidget {
  emailConfirmation({
    super.key,
  });

  @override
  State<emailConfirmation> createState() => _emailConfirmationState();
}

class _emailConfirmationState extends State<emailConfirmation> {
  @override
  Widget build(BuildContext context) {
    Future<dynamic> confirmEmail(String key) async {
      Map<String, String> body = {"key": key};
      var url = Uri.parse("$baseUrl/accounts/auth/confirm-email/");
      var res = await http.post(url, body: body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.green,
            content: Text(
              "Registration Successful",
              textAlign: TextAlign.center,
            )));
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => UserLoginPage()));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.red,
            content: Text(
              "Key error",
              textAlign: TextAlign.center,
            )));
      }
    }

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _UserKey = new TextEditingController();
    return Scaffold(
      body: Center(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  LargeText(
                    text: "Confirm Your Email",
                    color: Colours.secondaryColor,
                  ),
                  Center(
                    child: Lottie.asset('assets/lottie/mail.json',
                        height: 280.h, width: 290.w),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.w,
                      right: 30.w,
                      bottom: 5.h,
                    ),
                    child: NtextField(
                        controller: _UserKey,
                        name: "Token",
                        validator: ValidationOfFields.valToken),
                  ),
                  Center(
                    child: smallText(
                      text: "Please enter the token sent to you via email",
                      overFlow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonContainer(
                      butborderColor: Colours.secondaryColor,
                      text: "Confirm",
                      butColor: Colours.secondaryColor,
                      onClick: () async {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          var authResponse = await confirmEmail(_UserKey.text);
                          // if (authResponse.runtimeType == int) {
                          //   // ignore: use_build_context_synchronously
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //           duration: Duration(milliseconds: 1000),
                          //           backgroundColor: Colors.red,
                          //           content: Text(
                          //             "Key error",
                          //             textAlign: TextAlign.center,
                          //           )));
                          // } else if (authResponse.runtimeType == String) {
                          //   // ignore: use_build_context_synchronously
                          //   showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return Dialog(
                          //         child: Container(
                          //           alignment: Alignment.center,
                          //           height: 200.h,
                          //           width: 250.w,
                          //           decoration: const BoxDecoration(),
                          //           child: const Text(
                          //             "Registration Successful",
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   );
                          //   // ignore: use_build_context_synchronously
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) {
                          //       return UserLoginPage();
                          //     }),
                          //   );
                          // }
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
