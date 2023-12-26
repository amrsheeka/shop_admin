import 'package:flutter/material.dart';
import 'package:shop_admin/core/utils/styles.dart';

Widget defaultButton(
    {required void Function()? onPressed,
      required String text,
      Icon? icon,
      Color? color = Styles.mainColor}) =>
    Container(
      width: 180,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        disabledColor: Colors.blueGrey[100],
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icon != null
              ? [
            icon,
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ]
              : [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );