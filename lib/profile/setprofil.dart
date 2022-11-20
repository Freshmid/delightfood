import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base_app/base.dart';
import 'package:http/http.dart' as http;

class Setprofile extends StatefulWidget {
  const Setprofile({Key? key}) : super(key: key);

  @override
  _setprofilScreen createState() => _setprofilScreen();
}

class _setprofilScreen extends State<Setprofile> {
  final namacontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final tanggallahircontroller = TextEditingController();
  var image;

  _setprofilScreen() {
    getUser();
  }

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final response =
        await http.get(Uri.parse("${dotenv.get('API_URL')}/user?id=1"));
    print(jsonDecode(response.body)["data"]);
    namacontroller.text = jsonDecode(response.body)["data"]["nama"];
    emailcontroller.text = jsonDecode(response.body)["data"]["email"];
    tanggallahircontroller.text =
        jsonDecode(response.body)["data"]["tanggal_lahir"];
    image = jsonDecode(response.body)["data"]["gambar"];
    setState(() {});
  }

  void backtoBase() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BaseApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      NetworkImage("${dotenv.get('ASSET_URL')}/user/${image}"),
                )
              ],
            ),

            Container(
              height: 20,
            ),

            inputemail(),

            Container(
              height: 20,
            ),

            inputnama(),

            Container(
              height: 20,
            ),

            tanggallahir(),

            Container(
              height: 20,
            ),
            // lokasi(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 0),
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                    elevation: 5,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Color(0xFFff9934),
                  ),
                  onPressed: () {
                    backtoBase();
                  },
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget inputemail() {
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
            controller: namacontroller,
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

  Widget inputnama() {
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
            keyboardType: TextInputType.name,
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

  Widget tanggallahir() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "tanggal lahir",
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
            controller: tanggallahircontroller,
            keyboardType: TextInputType.datetime,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.date_range, color: Color(0xFFE7872C)),
                hintText: 'Tanggal Lahir',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget lokasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lokasi",
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
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Color(0xFFE7872C)),
                hintText: 'Lokasi',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }
}
