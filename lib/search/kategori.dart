import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'search.dart';
import 'search_builder.dart';

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

<<<<<<< HEAD
  // Widget Cemilan() {
  //   return Container(
  //       height: 100,
  //       width: double.infinity,
  //       child: ElevatedButton(
  //           onPressed: () {
  //             (goFpsearch());
  //           },
  //           style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
  //           child: Text("Camilan"),
  //           ));
  // }

  // Widget Kue() {
  //   return Container(
  //       height: 100,
  //       width: double.infinity,
  //       child: ElevatedButton(
  //           onPressed: () {
  //             goFpsearch();
  //           },
  //           style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
  //           child: Text("Kue"),
  //           ));
  // }
=======
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
>>>>>>> d4f63039de1922eb3a6b9eb75df0385fad4ec416

  // Widget Minuman() {
  //   return Container(
  //       height: 100,
  //       width: double.infinity,
  //       child: ElevatedButton(
  //           onPressed: () {
  //             goFpsearch();
  //           },
  //           style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
  //           child: Text("Minuman"),
  //           ));
  // }

  // Widget Sayuran() {
  //   return Container(
  //       height: 100,
  //       width: double.infinity,
  //       child: ElevatedButton.icon(
  //           onPressed: () {
  //             goFpsearch();
  //           },
  //           style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
  //           icon: Icon(Icons.mail, size: 30),
  //           label: Text('Sayuran')));
  // }

  // Widget Seafood() {
  //   return Container(
  //       height: 100,
  //       width: double.infinity,
  //       child: ElevatedButton.icon(
  //           onPressed: () {
  //             goFpsearch();
  //           },
  //           style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
  //           icon: Icon(Icons.mail, size: 30),
  //           label: Text('Seafood')));
  // }

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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
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

                  Container(
                    child: const CategoryItems(),
                  )

                  // SizedBox(height: 50),
                  // Cemilan(),
                  // SizedBox(height: 25),
                  // Kue(),
                  // SizedBox(height: 20),
                  // Minuman(),
                  // SizedBox(height: 15),
                  // Sayuran(),
                  // SizedBox(height: 10),
                  // Seafood(),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
