// ignore_for_file: must_be_immutable, camel_case_types
import 'package:karkhana/Packages/Packages.dart';

class smallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;
  TextDecoration? decoration;
  int maxline;
  smallText({
    Key? key,
    this.color = Colours.textColor2,
    required this.text,
    this.size = 14,
    this.height = 1.2,
    this.overFlow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
    this.maxline = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
      text,
      overflow: overFlow,
      maxLines: maxline,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size.sp,
        height: height,
        fontWeight: FontWeight.w400,
        decoration: decoration,
      ),
    );
  }
}
