import 'package:flutter/material.dart';
import 'package:login_signup/components/text_field_container.dart';
import 'package:login_signup/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Color color;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.color = kPrimaryColor,
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
