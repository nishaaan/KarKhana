// ignore_for_file: file_names, must_be_immutable
import 'package:karkhana/Packages/Packages.dart';

class ButtonContainerIcon extends StatelessWidget {
  final String text;
  IconData? icon;
  final VoidCallback onClick;
  final Color butColor;
  final Color textColor;
  final Color butborderColor;
  ButtonContainerIcon(
      {Key? key,
      required this.butborderColor,
      required this.text,
      required this.butColor,
      required this.onClick,
      this.textColor = Colours.backgroundColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.only(right: 7.w, left: 10.w),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
          ),
          width: 300.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 1.8,
                  offset: const Offset(
                    0,
                    3,
                  )),
            ],
            border: Border.all(
              color: butborderColor,
            ),
            borderRadius: BorderRadius.circular(
              16,
            ),
            color: butColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colours.backgroundColor,
              ),
              SizedBox(
                width: 8.w,
              ),
              LargeText(
                text: text,
                color: textColor,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
