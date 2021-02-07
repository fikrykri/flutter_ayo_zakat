// import 'package:flutter/material.dart';

// Widget buildTextField({labelText, placeholder, isPasswordTextField}) {
//   bool showPassword = false;
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 35.0),
//     child: TextField(
//       obscureText: isPasswordTextField ? showPassword : false,
//       decoration: InputDecoration(
//           suffixIcon: isPasswordTextField
//               ? IconButton(
//                   onPressed: () {
//                     setState(() {
//                       showPassword = !showPassword;
//                     });
//                   },
//                   icon: Icon(
//                     Icons.remove_red_eye,
//                     color: Colors.grey,
//                   ),
//                 )
//               : null,
//           contentPadding: EdgeInsets.only(bottom: 3),
//           labelText: labelText,
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           hintText: placeholder,
//           hintStyle: TextStyle(
//             fontSize: 16,
//             color: Colors.grey[300],
//           )),
//     ),
//   );
// }
