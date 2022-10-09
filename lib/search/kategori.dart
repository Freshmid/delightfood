import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'search.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  _KategoriScreen createState() => _KategoriScreen();
}

class _KategoriScreen extends State<Kategori> {
  goFpsearch() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: ((context) => SearchPage())),
    );
  }

  Widget Kue() {
    return Container(
        height: 100,
        width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              goFpsearch();
            },
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.mail, size: 30),
            label: Text('kue')));
  }

  Widget Minuman() {
    return Container(
        height: 100,
        width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              goFpsearch();
            },
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.mail, size: 30),
            label: Text('Minuman')));
  }

  Widget Sayuran() {
    return Container(
        height: 100,
        width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              goFpsearch();
            },
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.mail, size: 30),
            label: Text('Sayuran')));
  }

  Widget Seafood() {
    return Container(
        height: 100,
        width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              goFpsearch();
            },
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.mail, size: 30),
            label: Text('Seafood')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Kategori",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFE7872C),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Silahkan pilih kategori yang anda inginkan',
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Cemilan(),
                  SizedBox(height: 25),
                  Kue(),
                  SizedBox(height: 20),
                  Minuman(),
                  SizedBox(height: 15),
                  Sayuran(),
                  SizedBox(height: 10),
                  Seafood(),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
