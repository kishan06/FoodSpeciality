import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.validator,
    this.inputFormatters,
    required this.hintText,
    required this.validatorText,
    this.textEditingController,
    this.leadingIcon,
    this.suffixIcon,
    this.readonly = false,
    this.isInputPassword = false,
    this.outlineColor = const Color(0xFFFFB600),
    // this.keyboardType,
    this.texttype,
  }) : super(key: key);

  final dynamic validator;
  final TextEditingController? textEditingController;
  final String hintText;
  final String validatorText;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final bool isInputPassword;
  final bool readonly;
  final dynamic inputFormatters;
  final Color outlineColor;

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
    return SizedBox(
      height: 50.h,
      child: TextFormField(
          style: TextStyle(
            fontSize: 15.sp,
          ),
          readOnly: widget.readonly,
          cursorColor: const Color(0xFF3B3F43),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xFF707070), width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xFF707070), width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xFF707070), width: 1.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color: Colors.red, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color: Colors.red, width: 1.w),
            ),
            hintStyle: TextStyle(
                color: Color(0xFF707070),
                fontSize: 14.sp,
                fontFamily: "Roboto"),
            hintText: widget.hintText,
            prefixIcon: widget.leadingIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: widget.leadingIcon!,
                  ),
            suffixIcon: widget.isInputPassword
                ? GestureDetector(
                    onTap: () => setState(() => obscureText = !obscureText),
                    child: obscureText
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_outline,
                                color: Colors.black54,
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_open_outlined,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                  )
                : widget.suffixIcon,
          ),
          keyboardType: widget.texttype,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters),
    );
  }
}
