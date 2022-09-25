import 'package:flutter/material.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({ Key? key }) : super(key: key);

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  String user_name = "NirvanaXDD";
  String user_email = "@nirvanadd";
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Ink(
            height: (MediaQuery.of(context).size.height/18),
            decoration: const ShapeDecoration(
              // color: Colors.white24,
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              iconSize: (MediaQuery.of(context).size.height/32),
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
                    fontSize: MediaQuery.of(context).size.height/40,
                    fontWeight: FontWeight.bold
                    // fontSize: 24,
                  ),
                ),
              ),

              Container(height: 2,),
              
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  user_email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height/60,
                    // fontSize: 24,
                  ),
                ),
              ),

              
            ],

          ),
        ),

        Container(
          width: (MediaQuery.of(context).size.width/12),
        ),

        Container(
          child: IconButton(
            icon: const Icon(Icons.settings),
            iconSize: (MediaQuery.of(context).size.height/32),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}


