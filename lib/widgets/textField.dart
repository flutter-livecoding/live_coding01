import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textField(String title, TextEditingController controller, Widget widget, bool obscureText) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: Column(
      children: [
        Row(
          children: [
            Text(title),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffix:  widget,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color:Colors.lightBlue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
