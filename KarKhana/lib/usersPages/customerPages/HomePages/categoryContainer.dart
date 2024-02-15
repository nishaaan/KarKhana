// ignore_for_file: file_names, must_be_immutable

import 'package:karkhana/Packages/Packages.dart';

class CategoryContainer extends StatefulWidget {
  Color backgroundColor;
  Image categoryImage;
  String categoryName;
  CategoryContainer({
    super.key,
    required this.backgroundColor,
    required this.categoryImage,
    required this.categoryName,
  });

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 100.w,
      color: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                widget.categoryImage,
                LargeText(
                  text: widget.categoryName,
                  color: Colours.backgroundColor,
                  size: 14,
                ),
                LargeText(
                  text: "Deals",
                  color: Colours.backgroundColor,
                  size: 14,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
