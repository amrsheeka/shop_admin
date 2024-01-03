import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/styles.dart';

Widget defaultFormField(
    {onPressed,
      void Function(String)? onChanged,
      maxLines = 1,
      Icon? suffixIcon,
      Icon? prefixIcon,
      TextInputType? keyboardType,
      String? initialValue,
      bool obscureText = false,
      EdgeInsets? contentPadding,
      required String label,
      bool digital=false,
      String? Function(String?)? validator,
      TextEditingController? controller}) =>
    TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      initialValue: initialValue,
      onChanged: onChanged,
      inputFormatters: digital?<TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ]:null,
      decoration: InputDecoration(
        contentPadding: prefixIcon !=null?const EdgeInsets.symmetric(vertical: 15):const EdgeInsets.all(15),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: Styles.mainColor,
        focusColor: Styles.mainColor,
        iconColor: Styles.mainColor,
        fillColor: Styles.backgroundColor,
        filled: true,
        hintText: label,

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.white,
            //width: 2.0,
          ),
        ),
      ),
    );