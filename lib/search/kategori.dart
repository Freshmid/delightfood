import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'search_builder.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  _KategoriScreen createState() => _KategoriScreen();
}

class _KategoriScreen extends State<Kategori> {
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
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
