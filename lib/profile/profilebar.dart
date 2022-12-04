import 'dart:convert';
import 'dart:io';
import '../onboarding/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setprofil.dart';
import 'package:http/http.dart' as http;



class ProfileBar extends StatefulWidget {
  const ProfileBar({ Key? key }) : super(key: key);

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  _ProfileBarState() {
    getUser();
  }
  String namacontroller = "";
  String emailcontroller = "";

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final response = await http.get(Uri.parse(
        "http://delight.foundid.my.id/api/user?id=${prefs.getInt('user_id')}"));
    try {
      namacontroller = jsonDecode(response.body)["data"]["nama"];
      emailcontroller = jsonDecode(response.body)["data"]["email"];
    } catch (e){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      goLogin();
    } finally {
      print("Usually Error");
    }
    // tanggallahircontroller.text = jsonDecode(response.body)["data"]["tanggal_lahir"];
    // image = jsonDecode(response.body)["data"]["gambar"];
    setState(() {});
  }

  void goLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  void settingProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Setprofile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Ink(
            height: 45,
            decoration: const ShapeDecoration(
              // color: Colors.white24,
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              iconSize: 30,
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ),

        Container(
          width: (MediaQuery.of(context).size.width/30),
        ),

        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width/2,

          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  namacontroller,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    // fontSize: 24,
                  ),
                ),
              ),

              // Container(height: 2,),
              
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  emailcontroller,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    // fontSize: 24,
                  ),
                ),
              ),

              
            ],

          ),
        ),


        Container(
          width: MediaQuery.of(context).size.width/3 - 35,
          child: IconButton(
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.settings),
            iconSize: 35,
            color: Colors.white,
            onPressed: () {settingProfile();},
          ),
        ),
      ],
    );
  }
}


