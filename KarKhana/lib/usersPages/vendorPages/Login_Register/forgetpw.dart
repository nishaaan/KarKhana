// ignore_for_file: unnecessary_new, non_constant_identifier_names, prefer_final_fields, annotate_overrides

import 'package:karkhana/Packages/Packages.dart';

class VendorForgetPw extends StatefulWidget {
  const VendorForgetPw({super.key});

  @override
  State<VendorForgetPw> createState() => _VendorForgetPwState();
}

class _VendorForgetPwState extends State<VendorForgetPw> {
  TextEditingController _UserEmail = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void dispose() {
    _UserEmail.dispose();

    super.dispose();
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
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  ListTile(
                    title: Text(
                      'Forget Password',
                      style: TextStyle(
                          color: Colours.textColor,
                          fontSize: 38.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProximaNova',
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Lottie.asset('assets/lottie/forgetpwMail.json',
                        height: 100.h, width: 180.w),
                  ),
                  NtextField(
                    controller: _UserEmail,
                    name: 'Email',
                    prefix: const Icon(Icons.person_outline),
                    autofocus: true,
                    validator: ValidationOfFields.valEmail,
                  ),
                  ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: smallText(
                        text: "A reset link will be sent to the above email!",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ButtonContainer(
                        text: 'Send link',
                        onClick: () {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            Navigator.pop(context);
                          }
                        },
                        butColor: Colours.secondaryColor,
                        butborderColor: Colours.secondaryColor,
                      ),
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
}
