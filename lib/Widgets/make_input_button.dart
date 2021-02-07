import 'package:flutter/material.dart';

Widget makeInput(
    {label,
    obscureText = false,
    controller,
    validator,
    onSaved,
    readOnly = false,
    value,
    onChanged,
    keyboardType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obscureText,
        controller: controller,
        initialValue: value,
        onChanged: onChanged,
        readOnly: readOnly,
        keyboardType: keyboardType,
        onSaved: (val) => onSaved = val,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
