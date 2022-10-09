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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                    decoration: BoxDecoration(
                        color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.1
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
                          Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.8,
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
                          ),
                          SizedBox(height: 20),
                          Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.8,
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
                          )
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