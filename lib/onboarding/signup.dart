import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base_app/base.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUp> {
  bool _isHide = true;
  bool _isHide2 = true;

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confpasswordcontroller.dispose();
    super.dispose();
  }

  void fetchRegister() async {
    final prefs = await SharedPreferences.getInstance();
    print("----Sending Request----");
    final response = await http.post(
      // Uri.parse("${dotenv.get('API_URL')}/register"),
        Uri.parse('http://delight.foundid.my.id/api/register'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "fullname": namecontroller.text,
          "email": emailcontroller.text,
          "password": passwordcontroller.text,
          "confirmPassword": confpasswordcontroller.text,
        }));
    print("----Sign Up----");
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["status"] == true) {
        await prefs.setInt('user_id', jsonDecode(response.body)["data"]["id"]);
        print("----Complete----");
        goHome();
      } else {
          CoolAlert.show(
          context: context,
          backgroundColor: Color(0xFFff9934),
          type: CoolAlertType.error,
          title: 'Error',
          text: "Data yang Dimasukkan Salah!",
          confirmBtnText: 'Oke', confirmBtnColor: Color(0xFFff9934));
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

  void goLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  Widget inputFullname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fullname",
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
            controller: namecontroller,
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.people, color: Color(0xFFE7872C)),
                hintText: 'Fullname',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
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

  Widget inputConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm Password",
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
            controller: confpasswordcontroller,
            obscureText: _isHide2,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xFFE7872C)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isHide2 ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black26,
                  ),
                  onPressed: () {
                    setState(() {
                      _isHide2 = !_isHide2;
                    });
                  },
                ),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget signUpButton() {
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
            fetchRegister();
            // goHome();
          },
          child: Text(
            "SIGN UP",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget haveAccount() {
    return GestureDetector(
      onTap: () {
        goLogin();
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(color: Color(0xFFE7872C))),
          TextSpan(
              text: 'Login',
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
                decoration: BoxDecoration(color: Colors.white),
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
                        'Sign Up',
                        style: TextStyle(
                            color: Color(0xFFE7872C),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      inputFullname(),
                      SizedBox(height: 20),
                      inputEmail(),
                      SizedBox(height: 20),
                      inputPassword(),
                      SizedBox(height: 20),
                      inputConfirmPassword(),
                      signUpButton(),
                      haveAccount()
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