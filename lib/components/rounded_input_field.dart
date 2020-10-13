import 'package:flutter/material.dart';
import 'package:login_signup/components/text_field_container.dart';
import 'package:login_signup/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Color color;
  final Function validator;
  final Function controller;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.color = kPrimaryColor,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: color,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
