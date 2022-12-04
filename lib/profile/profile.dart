import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
      children: [
        Column(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width/1.2,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     // color: Color(0xFFff9934),
            //     border: Border.all(
            //       color: Color(0xFFff9934),
            //       width: 1.4
            //       ),
            //     borderRadius: BorderRadius.circular(45)
            //   ),
            //   child: Center(
            //     child: TextField(
            //       decoration: InputDecoration(
            //           prefixIcon: Icon(
            //             Icons.search,
            //             ),
                      
            //           // suffixIcon: IconButton(
            //           //   icon: Icon(Icons.clear),
            //           //   onPressed: () {
            //           //     /* Clear the search field */
            //           //   },
            //           // ),
            //           hintText: "Cari Favorit...",
            //           hintStyle: TextStyle(
            //             ),
            //           border: InputBorder.none),
            //     ),
            //   ),
            // ),

            // Divider(
            //   thickness: 0.5,
            //   indent: MediaQuery.of(context).size.width/18,
            //   endIndent: MediaQuery.of(context).size.width/18,
            //   color: Color(0xFFff9934),
            //   height: 40,
            // ),

            Container(
              child: Image.asset(
                "assets/logos/—Pngtree—cartoon little fresh couple cooking_4371114.png",
                width: MediaQuery.of(context).size.width/1.5,
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: Text(
                "Belum Ada Resep Yang Disimpan",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight. bold,
                  fontSize: 18,
                  overflow: TextOverflow.clip
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              height: 20,
            ),

            Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: Text(
                "Ayo Buat Resep favoritmu Sekarang juga!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.clip
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}