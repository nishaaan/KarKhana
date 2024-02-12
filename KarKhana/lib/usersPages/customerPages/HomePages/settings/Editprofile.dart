// ignore_for_file: unnecessary_new, prefer_final_fields, file_names

import 'package:karkhana/Packages/Packages.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
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
              Center(
                  child: LargeText(
                text: "EDIT PROFILE",
                size: 25,
                color: Colours.secondaryColor,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  children: [
                    NtextField(
                        controller: fName,
                        name: "First Name",
                        validator: ValidationOfFields.valName),
                    SizedBox(
                      height: 20.h,
                    ),
                    NtextField(
                        controller: lName,
                        name: "Last Name",
                        validator: ValidationOfFields.valName),
                    SizedBox(
                      height: 20.h,
                    ),
                    ButtonContainer(
                      butborderColor: Colours.secondaryColor,
                      text: "Update profile",
                      butColor: Colours.secondaryColor,
                      onClick: () async {
                        final isValidForm = _formKey.currentState!.validate();
                        String id = user.token!;
                        String name = fName.text + " " + lName.text;
                        if (isValidForm) {
                          editProfile(id, name);
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: LargeText(
                                  text: "Edit profile",
                                  color: Colours.secondaryColor,
                                ),
                                content: smallText(
                                  text:
                                      "Your profile has been updated successfully.",
                                  maxline: 2,
                                ),
                                actions: [
                                  SimpleDialogOption(
                                    child: const Text("Close"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            },
                          );
                          setState(() {
                            fName.clear();
                            lName.clear();
                          });
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
