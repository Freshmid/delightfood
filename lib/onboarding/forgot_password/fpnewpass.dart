import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fpupdatepass.dart';

class FpNewPassword extends StatefulWidget {
  @override
  _FpNewPassword createState() => _FpNewPassword();
}

class _FpNewPassword extends State<FpNewPassword> {
  bool _isHide = true;
  bool _isHide2 = true;

  void goFpUpdatePass() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FpUpdatePass(),
      ),
    );
  }

  Widget inputNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New Password",
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
            obscureText: _isHide,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFFE7872C)
                ),
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
                hintText: 'New Password',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
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
            obscureText: _isHide2,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFFE7872C)
                ),
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
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget updateButton() {
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
            goFpUpdatePass();
          },
          child: Text(
            "UPDATE",
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
                              Icons.note_alt_outlined,
                              color: Colors.black38,
                              size: 100
                          ),
                          Text(
                              'New Credentials',
                              style: TextStyle(
                                  color: Color(0xFFE7872C),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Your identity has been verified!',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Set your new password',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 50),
                          inputNewPassword(),
                          SizedBox(height: 20),
                          inputConfirmPassword(),
                          updateButton()
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