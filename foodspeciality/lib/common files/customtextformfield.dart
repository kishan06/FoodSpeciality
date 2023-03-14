import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.validator,
    this.inputFormatters,
    required this.hintText,
    required this.validatorText,
    this.textEditingController,
    this.leadingIcon,
    this.onTap,
    this.suffixIcon,
    this.readonly = false,
    this.isInputPassword = false,
    this.outlineColor = const Color(0xFFFFB600),
    // this.keyboardType,
    this.suffixIconConstraints,
    this.texttype,
  }) : super(key: key);

  final dynamic validator;
  final TextEditingController? textEditingController;
  final String hintText;
  final String validatorText;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final bool isInputPassword;
  void Function()? onTap;
  final bool readonly;
  final dynamic inputFormatters;
  final Color outlineColor;
  final BoxConstraints? suffixIconConstraints;

  final TextInputType? texttype;

  @override
  State<CustomTextFormField> createState() => _CustomtextFormFieldState();
}

class _CustomtextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isInputPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(
          fontSize: 16.sm,
        ),
        // onTap: ontap,
        readOnly: widget.readonly,
        cursorColor: const Color(0xFF3B3F43),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        controller: widget.textEditingController,
        onTap: widget.onTap,
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(),
          contentPadding: const EdgeInsets.all(17),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          hintStyle: TextStyle(
              color: const Color(0xFF54595F63),
              fontSize: 15.sm,
              fontFamily: "Roboto"),
          hintText: widget.hintText,
          suffixIcon: widget.leadingIcon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: widget.leadingIcon!,
                ),
          prefixIconConstraints: const BoxConstraints(minWidth: 20),
          prefixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.isInputPassword
                  ? GestureDetector(
                      onTap: () => setState(() => obscureText = !obscureText),
                      child: obscureText
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Colors.black54,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                  ),
                                  child: Icon(
                                    Icons.lock_open_outlined,
                                    color: Colors.black54,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: widget.suffixIcon,
                    ),
              sizedBoxWidth(2),
              SizedBox(
                height: 30.h,
                child: VerticalDivider(
                  thickness: 1,
                  width: 15.w,
                  color: const Color(0xff54595F63),
                ),
              ),
            ],
          ),
        ),
        keyboardType: widget.texttype,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters);
  }

  Widget eyesuffix() {
    return GestureDetector(
      onTap: () => setState(() => obscureText = !obscureText),
      child: obscureText
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  child: Icon(
                    Icons.lock_open_outlined,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
    );
  }
}
