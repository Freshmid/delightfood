import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base_app/base.dart';
import 'signup.dart';
import 'forgot_password/fpemail.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<Login> {
  bool _isRemember = false;
  bool _isHide = true;
  bool _wrong = false;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void fetchLogin() async {
    // goHome();
    final prefs = await SharedPreferences.getInstance();
    print("----Sending Request----");
    final response = await http.post(
      // Uri.parse("${dotenv.get('http://delight.foundid.my.id/api')}/login"),
        Uri.parse('http://delight.foundid.my.id/api/login'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "email": emailcontroller.text,
          "password": passwordcontroller.text,
        }));
    // print(emailcontroller);
    print("----Login----");
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["status"] == true) {
        await prefs.setInt('user_id', jsonDecode(response.body)["data"]["id"]);
        print("---Complete----");
        goHome();
      } else {
        // // bool _wrong = true;
        // //             if (_wrong) {
        // CoolAlert.show(
        //     context: context,
        //     type: CoolAlertType.error,
        //     title: 'Eror',
        //     text: "Username Atau Password Yang Dimasukkan Salah ",
        //     confirmBtnText: 'Oke');
        // // }
      }
    } else {
      throw Exception('Failed to load');
    }
  }

  void goHome() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BaseApp(),
      ),
    );
  }

  void goSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUp(),
      ),
    );
  }

  void goFpEmail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FpEmail(),
      ),
    );
  }

  Widget inputEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE7872C),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: emailcontroller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Color(0xFFE7872C)),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget inputPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE7872C),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: passwordcontroller,
            obscureText: _isHide,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xFFE7872C)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isHide ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black26,
                  ),
                  onPressed: () {
                    setState(() {
                      _isHide = !_isHide;
                    });
                  },
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget forgetPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          goFpEmail();
        },
        child: Text(
          "Forget Password?",
          style:
          TextStyle(color: Color(0xFFE7872C), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget rememberMe() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.black26),
              child: Checkbox(
                value: _isRemember,
                checkColor: Colors.white,
                activeColor: Color(0xFFE7872C),
                onChanged: (value) {
                  setState(() {
                    _isRemember = value!;
                  });
                },
              )),
          Text(
            "Remember Me",
            style: TextStyle(color: Color(0xFFE7872C)),
          )
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
          style: TextButton.styleFrom(
              elevation: 5,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFE7872C)),
          onPressed: () {
            fetchLogin();
          },
          child: Text(
            "LOGIN",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget dontHaveAccount() {
    return GestureDetector(
      onTap: () {
        goSignUp();
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have any account? ',
              style: TextStyle(color: Color(0xFFE7872C))),
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  color: Color(0xFFE7872C), fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/logos/logo_nobg.png")),
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xFFE7872C),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      inputEmail(),
                      SizedBox(height: 20),
                      inputPassword(),
                      forgetPassword(),
                      rememberMe(),
                      loginButton(),
                      dontHaveAccount()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}