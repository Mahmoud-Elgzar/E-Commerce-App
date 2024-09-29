import 'package:final_e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  //final _formKey = GlobalKey<FormState>();
  final String hint;
  final IconData icon;
  final Function (String?)? onClick;
  String _errorText(String str) {
    switch (hint) {
      case 'Enter Your Name':
        return 'Name is Empty';
      case 'Enter Your Email':
        return 'Email is Empty';
      case 'Enter Your Password':
        return 'Password is Empty';
      default:
        return '';
    }
  }

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.icon,
      required String errorText, required this.onClick
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        //key: _formKey,
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _errorText(hint);
          }
        },
        onSaved: onClick,
        obscureText: hint == 'Enter Your Password' ? true : false,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: kMainColor),
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
