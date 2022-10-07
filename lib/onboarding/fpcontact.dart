import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fpnewpass.dart';

class FpContact extends StatefulWidget {
  @override
  _FpContactScreen createState() => _FpContactScreen();
}

class _FpContactScreen extends State<FpContact> {
  goFpNewPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => FpNewPassword()
      ),
    );
  }

  Widget viaSms() {
    return Container(
      height: 100,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {goFpNewPassword();},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white
        ),
        icon: Icon(
          Icons.phone,
          size: 30
        ),
        label: Text(
          'via sms'
        )
      )
    );
  }

  Widget viaMail() {
    return Container(
      height: 100,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {goFpNewPassword();},
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white
        ),
        icon: Icon(
            Icons.mail,
            size: 30
        ),
        label: Text(
          'via mail'
        )
      )
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
                          Text(
                            "Make Selection",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFFE7872C),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Select which contact detail should we use to reset your password?',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 50),
                          viaSms(),
                          SizedBox(height: 20),
                          viaMail()
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