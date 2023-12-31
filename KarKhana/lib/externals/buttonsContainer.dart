// ignore_for_file: file_names

import 'package:karkhana/Packages/Packages.dart';

class ButtonContainer extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color textColor;
  final Color butColor;
  final Color butborderColor;
  final int width;
  final int height;
  const ButtonContainer({
    Key? key,
    required this.butborderColor,
    required this.text,
    required this.butColor,
    required this.onClick,
    this.textColor = Colours.backgroundColor,
    this.width = 300,
    this.height = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: height.h,
          ),
          width: width.w,
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
          child: LargeText(
            text: text,
            color: textColor,
            size: 16,
          )),
    );
  }
}
