import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signup/components/already_have_an_account_check.dart';
import 'package:login_signup/components/rounded_button.dart';
import 'package:login_signup/components/rounded_input_field.dart';
import 'package:login_signup/components/rounded_password_field.dart';
import 'package:login_signup/models/userModel.dart';
import 'package:login_signup/screens/login/components/background.dart';
import 'package:login_signup/signup/signup_screen.dart';

class Body extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserModel _user = UserModel();

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  _emailValidator(String val) {
    final expr =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (val.isEmpty) {
      return 'Email is required.';
    }
    if (!RegExp(expr).hasMatch(val)) {
      return "Enter valid email.";
    }
    return null;
  }

  _passwordValidator(String val) {
    if (val.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: emailController,
              hintText: "Your Email",
              onSaved: (value) {
                setState(() {
                  _user.email = value;
                });
              },
              validator: _emailValidator,
            ),
            RoundedPasswordField(
              controller: passwordController,
              onSaved: (value) {
                setState(() {
                  _user.password = value;
                });
              },
              validator: _passwordValidator,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () => _onLoginSubmit(),
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }

  _onLoginSubmit() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
  }
}
