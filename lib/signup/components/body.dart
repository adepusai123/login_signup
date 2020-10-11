import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signup/components/already_have_an_account_check.dart';
import 'package:login_signup/components/rounded_button.dart';
import 'package:login_signup/components/rounded_input_field.dart';
import 'package:login_signup/components/rounded_password_field.dart';
import 'package:login_signup/constants.dart';
import 'package:login_signup/screens/login/login_screen.dart';
import 'package:login_signup/signup/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "SIGNUP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.03),
        SvgPicture.asset(
          "assets/icons/signup.svg",
          height: size.height * 0.35,
        ),
        RoundedInputField(
          hintText: "Your Email",
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        ),
        RoundedButton(text: "SIGNUP", press: () {}),
        SizedBox(height: size.height * 0.02),
        AlreadyHaveAccountCheck(
          login: false,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
        ),
        OrDivider(),
      ],
    ));
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // we can use size.width since size.width === double.infinity
      width: size.width * 0.8,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 1.5,
            ),
          ),
          Text(
            "OR",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
