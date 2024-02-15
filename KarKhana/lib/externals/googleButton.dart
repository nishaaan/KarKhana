// ignore_for_file: file_names, camel_case_types, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:karkhana/Packages/Packages.dart';

class googleButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onClick;
  final Color butColor;
  googleButton({
    Key? key,
    required this.image,
    required this.text,
    required this.butColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 7.w),
        child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 17.h,
            ),
            width: 300.w,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 7, // soften the shadow
                  spreadRadius: 1, //extend the shadow
                  offset: Offset(
                    2.0, // Move to right 5  horizontally
                    4.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
              border: Border.all(
                color: Colours.textColor,
              ),
              borderRadius: BorderRadius.circular(
                16,
              ),
              color: butColor,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 25.w,
                ),
                SvgPicture.asset(
                  image,
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'ProximaNova',
                    fontStyle: FontStyle.normal,
                    color: Colours.backgroundColor,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
