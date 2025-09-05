
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:dentist/my_import.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.obscureText,
    this.onChanged,
    this.controller,
    required this.keyboardType,
    required this.label,
    this.showIcon = false,
    required this.validationType,
    this.borderRadius = 40.0,


    this.errorColor = Colors.black,
    this.shouldFadeInLeft = true,
    this.maxLines = 1,

    this.onIconTap,
  });
  final VoidCallback? onIconTap;
  final Color errorColor;

  final bool obscureText;
  final bool shouldFadeInLeft ;
  final int maxLines ;

  final bool showIcon;
  final ValueChanged<String>? onChanged;
  final double borderRadius;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String label;
  final String validationType;

  Color _getBorderColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.error)) {


      return errorColor;

    }
    // if (states.contains(WidgetState.error)) return Colors.black;
    if (states.contains(WidgetState.focused)) return Colors.teal;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return


      shouldFadeInLeft?
      FadeInLeft(



      duration: const Duration(seconds: 1),
      delay: const Duration(milliseconds: 500),
      child:buildTextFormField()
    )
    :

      buildTextFormField();

  }

  // maxLines: maxLines,


  Widget buildTextFormField(){

    return
      TextFormField(

        maxLines: maxLines,

      controller: controller,
        // onChanged: onChanged,
        validator: (value) {
          return validate(value!, validationType);
        },
        onChanged: (value) {},
        // validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: Colors.teal,

        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.5,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(

              color: errorColor,
              width: 1,
            ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide:  BorderSide(

              color: errorColor,
              width: 1.0,
            ),
          ),

          labelStyle: WidgetStateTextStyle.resolveWith(
                (states) => TextStyle(
              color: _getBorderColor(states),
              fontWeight: FontWeight.w600,
            ),
          ),

          suffixIcon: showIcon
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              // color: _getBorderColor({MaterialState.focused}),
              color: _getBorderColor({WidgetState.focused}),

            ),
            onPressed:   onIconTap,
          )
              : null,

          errorStyle: const TextStyle(
              height: 1,
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 8
          ),
        ),
      );
  }
}