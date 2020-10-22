import 'package:flutter/material.dart';
import 'package:login_signup/components/text_field_container.dart';
import 'package:login_signup/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final Function onSaved;
  final TextEditingController controller;
  final Function validator;
  const RoundedPasswordField({
    Key key,
    this.onSaved,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        validator: (value) => validator(value),
        obscureText: true,
        onSaved: onSaved,
        decoration: InputDecoration(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: Icon(Icons.visibility, color: kPrimaryColor),
            border: InputBorder.none),
      ),
    );
  }
}
