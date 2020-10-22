import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signup/components/already_have_an_account_check.dart';
import 'package:login_signup/components/rounded_button.dart';
import 'package:login_signup/components/rounded_input_field.dart';
import 'package:login_signup/components/rounded_password_field.dart';
import 'package:login_signup/screens/login/login_screen.dart';
import 'package:login_signup/signup/components/background.dart';
import 'package:login_signup/signup/components/orDivider.dart';
import 'package:login_signup/signup/components/social_icon.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
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
            height: size.height * 0.25,
          ),
          RoundedInputField(
            hintText: "Your Email",
            onSaved: (value) {},
          ),
          RoundedPasswordField(
            onSaved: (value) {},
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(iconSrc: "assets/icons/facebook.svg", press: () {}),
              SocialIcon(iconSrc: "assets/icons/google-plus.svg", press: () {}),
              SocialIcon(iconSrc: "assets/icons/twitter.svg", press: () {}),
            ],
          )
        ],
      ),
    ));
  }
}
