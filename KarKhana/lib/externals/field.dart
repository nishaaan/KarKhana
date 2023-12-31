// ignore_for_file: must_be_immutable
import 'package:karkhana/Packages/Packages.dart';

class NtextField extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final FormFieldValidator<String> validator;
  bool obsecure;
  // final VoidCallback onEditingCompleted;
  final TextInputType keyboardType;
  // final ValueChanged<String> onChanged;
  final Widget? prefix;
  final bool isPassword;
  final bool autofocus;
  final VoidCallback? ontap;
  final bool needArea;

  NtextField({
    Key? key,
    required this.controller,
    required this.name,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obsecure = false,
    this.prefix,
    this.isPassword = false,
    this.autofocus = false,
    this.ontap,
    this.needArea = false,
  }) : super(key: key);

  @override
  State<NtextField> createState() => _NtextFieldState();
}

class _NtextFieldState extends State<NtextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.needArea ? 5 : 1,
      onTap: widget.ontap,
      obscureText: widget.obsecure,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        //hintMaxLines: 20,
        labelText: widget.name,
        prefixIcon: widget.prefix,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obsecure = !widget.obsecure;
                  });
                },
                child: Icon(
                    widget.obsecure ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        hintText: widget.name,
        hintStyle: const TextStyle(color: Colours.textColor),
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colours.textColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colours.secondaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colours.errorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colours.secondaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: widget.validator,
    );
  }
}
