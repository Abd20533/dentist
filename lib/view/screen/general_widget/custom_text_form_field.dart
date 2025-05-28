// import 'package:animate_do/animate_do.dart';
// import 'package:dentist/core/mycore/validation.dart';
// import 'package:flutter/material.dart';
//
// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.obscureText,
//     this.callback,
//     this.controller,
//     required this.type,
//     required this.title,
//     this.icon,
//     required this.validationType,
//     show,
//     borderRadiusCircular,
//   });
//
//   final bool obscureText;
//   final bool show=true;
//
//   final VoidCallback? callback;
//   final double borderRadiusCircular = 40;
//   final TextEditingController? controller;
//   final TextInputType type;
//   final String title;
//   final IconData? icon;
//   final String validationType;
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeInLeft(
//       duration: const Duration(seconds: 1),
//       delay: const Duration(milliseconds: 500),
//       child: TextFormField(
//         controller: controller,
//         onFieldSubmitted: (value) {},
//         onChanged: (value) {},
//         validator: (value) {
//           return validate(value!, validationType);
//         },
//         keyboardType: type,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//             isDense: true,
//             contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
//             disabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black, width: 2)),
//
//
//             focusColor: Colors.blue,
//             fillColor:  Colors.blue,
//
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadiusCircular),
//                 borderSide: const BorderSide(
//                   color: Colors.blue, // تغيير اللون هنا إلى أزرق
//                   width: 2,
//                 )),
//
//             // الحدود العادية
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(
//                   style: BorderStyle.solid,
//                   color: Colors.black),
//               borderRadius: BorderRadius.circular(borderRadiusCircular),
//             ),
//
//             // عند وجود خطأ مع التركيز
//             focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadiusCircular),
//                 borderSide: const BorderSide(
//                   color: Colors.blue, // تغيير اللون هنا إلى أزرق
//                   style: BorderStyle.solid,
//                   width: 2,
//                 )),
//
//             // عند وجود خطأ بدون تركيز
//             errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadiusCircular),
//                 borderSide: const BorderSide(
//                   color: Colors.blue, // تغيير اللون هنا إلى أزرق
//                   width: 2,
//                 )),
//
//
//             errorStyle: const TextStyle(
//               color: Colors.blue, // لون نص الخطأ
//               fontWeight: FontWeight.bold,
//             ),
//
//             labelStyle: const TextStyle(
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13),
//
//             suffixIcon:show==true? IconButton(
//                 onPressed: callback,
//                 icon: Icon(
//                   obscureText ? Icons.visibility : Icons.visibility_off,
//                   color: Colors.blue, // تغيير لون الأيقونة إلى أزرق
//                 )):null,
//
//             label: Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue, // تغيير لون النص إلى أزرق
//               ),
//             )
//         ),
//       ),
//     );
//   }
// }
//


import 'package:animate_do/animate_do.dart';
import 'package:dentist/core/mycore/validation.dart';
import 'package:flutter/material.dart';

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
    this.onIconTap,
  });
  final VoidCallback? onIconTap;
  final bool obscureText;
  final bool showIcon;
  final ValueChanged<String>? onChanged;
  final double borderRadius;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String label;
  final String validationType;

  Color _getBorderColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.error)) return Colors.black;
    if (states.contains(MaterialState.focused)) return Colors.blue;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(seconds: 1),
      delay: const Duration(milliseconds: 500),
      child: TextFormField(
        controller: controller,
        // onChanged: onChanged,
                validator: (value) {
          return validate(value!, validationType);
        },
        onChanged: (value) {},
        // validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: Colors.blue, // <-- هنا تحديد لون المؤشر

        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),

          // حالة الحدود الديناميكية
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
              color: Colors.blue,
              width: 2.0,
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),

          // لون النص الديناميكي
          labelStyle: WidgetStateTextStyle.resolveWith(
                (states) => TextStyle(
              color: _getBorderColor(states),
              fontWeight: FontWeight.w600,
            ),
          ),

          // أيقونة الظهور الشرطية
          suffixIcon: showIcon
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: _getBorderColor({MaterialState.focused}),
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
      ),
    );
  }
}