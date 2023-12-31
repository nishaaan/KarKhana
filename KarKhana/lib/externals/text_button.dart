import 'package:karkhana/Packages/Packages.dart';

class TextButtons extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback onClick;
  const TextButtons(
      {super.key,
      required this.label,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
        textStyle: TextStyle(fontSize: 16.sp),
      ),
      child: Row(children: [
        SizedBox(
          width: 20.w,
        ),
        icon,
        SizedBox(
          width: 20.w,
        ),
        smallText(
          text: label,
          size: 18,
          color: Colours.textColor2,
        )
      ]),
    );
  }
}
