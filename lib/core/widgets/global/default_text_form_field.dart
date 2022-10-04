import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hint;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final bool isPassword;
  final bool showprefixIcon;
  final bool showSuffixIcon;
  final int? maxlenght;
  final Function()? ontap;
  final Function()? ontapPrefixIcon;
  final Function()? ontapSuffixIcon;

  const DefaultTextFormField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.showSuffixIcon = false,
    this.showprefixIcon = false,
    this.ontap,
    this.keyboardtype = TextInputType.text,
    this.maxlenght,
    this.prefixIcon = Icons.person,
    this.suffixIcon = Icons.person,
    this.ontapPrefixIcon,
    this.ontapSuffixIcon,
  }) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    print('the widget text field is rebuilt');
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      maxLines: 1,
      maxLength: widget.maxlenght,
      obscureText: widget.isPassword ? showPassword : false,
      keyboardType: widget.keyboardtype,
      controller: widget.controller,
      style: Theme.of(context).textTheme.subtitle1,
      // TODO: Edit & Understand
      // edit the color of border & understand inputDecoration widget
      decoration: InputDecoration(
        fillColor: AppColors.grey,
        iconColor: AppColors.orange,
        filled: true,
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.subtitle2,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        prefixIcon: widget.showprefixIcon
            ? Icon(
                widget.prefixIcon,
                size: 22,
                color: AppColors.orange,
              )
            : null,
        suffixIcon: getSuffixIcon(),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
    );
  }

  Widget? getSuffixIcon() {
    if (widget.showSuffixIcon) {
      if (!widget.isPassword) {
        return Icon(
          widget.suffixIcon,
          size: 22,
          color: AppColors.orange,
        );
      }
      return InkWell(
          onTap: (() {
            setState(() {
              showPassword = !showPassword;
            });
          }),
          child: !showPassword
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off));
    }
    return null;
  }
}
