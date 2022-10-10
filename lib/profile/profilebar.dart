import 'package:flutter/material.dart';
import 'setprofil.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({ Key? key }) : super(key: key);

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  String user_name = "NirvanaXDD";
  String user_email = "@nirvanadd";

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
                  user_name,
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
                  user_email,
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


