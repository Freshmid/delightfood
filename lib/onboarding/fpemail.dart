import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fpcontact.dart';

class FpEmail extends StatefulWidget {
  @override
  _FpEmailScreen createState() => _FpEmailScreen();
}

class _FpEmailScreen extends State<FpEmail> {
  goFpContact() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => FpContact()
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
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFFE7872C)
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget nextButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
          style: TextButton.styleFrom(
              elevation: 5,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              backgroundColor: Color(0xFFE7872C)
          ),
          onPressed: () {
            goFpContact();
          },
          child: Text(
            "NEXT",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          )
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
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.black38,
                        size: 100
                      ),
                      Text(
                        'Forget Password',
                        style: TextStyle(
                            color: Color(0xFFE7872C),
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Provide your account email for which you want to reset your password!',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 50),
                      inputEmail(),
                      nextButton()
                    ],
                  ),
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}