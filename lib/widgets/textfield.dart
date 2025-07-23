import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
  customtextfield({super.key, this.hinttext, this.onChanged, this.inputType});
  final String? hinttext;
  Function(String)? onChanged;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        obscureText: hinttext == 'Password' ? true : false,
        keyboardType: inputType,

        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
