// ignore_for_file: must_be_immutable, file_names

import 'package:karkhana/Packages/Packages.dart';

class LargeText extends StatelessWidget {
  final String text;
  Color? color;
  TextOverflow overFlow;
  double size;
  int maxline;
  LargeText({
    Key? key,
    required this.text,
    this.color = Colours.textColor2,
    this.size = 20,
    this.overFlow = TextOverflow.ellipsis,
    this.maxline = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      overflow: overFlow,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
