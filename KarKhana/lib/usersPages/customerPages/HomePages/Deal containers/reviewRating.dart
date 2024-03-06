// ignore_for_file: file_names, unused_import, must_be_immutable, prefer_final_fields, unnecessary_new, non_constant_identifier_names, avoid_print

import 'dart:ffi';

import 'package:karkhana/API/auth_api.dart';
import 'package:karkhana/Packages/Packages.dart';

class ReviewRatingForm extends StatefulWidget {
  String businessName;
  int businessID;
  ReviewRatingForm({
    super.key,
    required this.businessID,
    required this.businessName,
  });

  @override
  State<ReviewRatingForm> createState() => _ReviewRatingFormState();
}

class _ReviewRatingFormState extends State<ReviewRatingForm> {
  TextEditingController _UserReview = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String? Rating;

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;

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
                  LargeText(
                    text: "Give Review & Rating",
                    size: 25,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  NtextField(
                    controller: _UserReview,
                    name: 'Write your review',
                    prefix: const Icon(Icons.rate_review_outlined),
                    autofocus: true,
                    validator: ValidationOfFields.valField,
                    needArea: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      Rating = rating.toString();
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ButtonContainer(
                        text: 'Submit',
                        onClick: () {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            postReviewRating(
                              Rating!,
                              _UserReview.text,
                              widget.businessName,
                              user.name!,
                              widget.businessID,
                            );
                            setState(() {});
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
