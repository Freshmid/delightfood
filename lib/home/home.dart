import 'package:flutter/material.dart';
import 'home_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFFDAF61),
                Color.fromARGB(255, 250, 209, 169),
              ],
            ),
          ),
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/img-one-pan-spaghetti.webp"))),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img-gnocchi.webp"))),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          child: Text(
            "Inspirasi Menu Hari Ini",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 92, 92, 92),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.width/2.5,
            child: InspiringResep(),
            ),
        // Container(
        //   height: 20,
        // ),
        Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFFDAF61),
                  Color.fromARGB(255, 250, 209, 169),
                ],
              ),
            )),
        Container(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          child: Text(
            "Rekomendasi",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 92, 92, 92),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RecommendedResep(),
        ),
      ],
    );
  }
}
