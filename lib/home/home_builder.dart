import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom_fonts.dart';
import '../obj_resep.dart';
import '../description/resipes_description.dart';
import 'package:http/http.dart' as http;

// import 'package:delightfood/testapi.dart';

class InspiringResep extends StatefulWidget {
  const InspiringResep({Key? key}) : super(key: key);



  @override
  _InspiringResepState createState() => _InspiringResepState();
}

class _InspiringResepState extends State<InspiringResep> {
  // API
  // final emailcontroller = TextEditingController();
  // final passwordcontroller = TextEditingController();
  // @override
  // void dispose() {
  //   emailcontroller.dispose();
  //   passwordcontroller.dispose();
  //   super.dispose();
  // }
  // void fetchHome() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   print("----Sending Request----");
  //   final response = await http.post(
  //     // Uri.parse("${dotenv.get('http://delight.foundid.my.id/api')}/login"),
  //     Uri.parse('http://delight.foundid.my.id/api/login'),
  //     headers: <String, String>{
  //       "Content-Type": "application/json;charset=UTF-8"
  //     },
  //     body: jsonEncode(<String, String>{
  //       "email": emailcontroller.text,
  //       "password": passwordcontroller.text,
  //     }));
  //   print("----Login----");
  //   if (response.statusCode == 200) {
  //     if (jsonDecode(response.body)["status"] == true) {
  //       await prefs.setInt('user_id', jsonDecode(response.body)["data"]["id"]);
  //       print("---Complete----");
  //     }
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

  Widget components(BuildContext context, i) {
    return GestureDetector(
      // onTap: () {fetchHome();},
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(recipesAll.recipe[i].image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      itemCount: recipesAll.recipe.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: components(context, i),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return ListView(
//     scrollDirection: Axis.horizontal,
//     children: dataCar
//   );
// }
// }

class RecommendedResep extends StatefulWidget {
  const RecommendedResep({Key? key}) : super(key: key);

  @override
  State<RecommendedResep> createState() => _RecommendedResepState();
}

class _RecommendedResepState extends State<RecommendedResep> {

  void readDescription() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => RecipesDescription())
    );
  }


  Widget components(BuildContext context, i) {
    return Container(
      // height: MediaQuery.of(context).size.width/2.3,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFC2C2C2),
            offset: const Offset(
              4.0,
              3.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: readDescription,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height <= 720
                        ? MediaQuery.of(context).size.height / 2.5
                        : MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: AssetImage(recipesAll.recipe[i].image),fit: BoxFit.cover)
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      height: 40,
                      decoration: const ShapeDecoration(
                        // color: Colors.white24,
                        color: Colors.brown,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        icon: Icon(Icons.person),
                        iconSize: 25,
                        color: Colors.white,
                        onPressed: () {
                          print(recipesAll.recipe[0].title);
                        },
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: Text(
                        recipesAll.recipe[i].title,
                        style: BasicHeading,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: recipesAll.recipe.length,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: components(context, i),
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                MediaQuery.of(context).size.height <= 720 ? 1.4 : 0.7));
  }
}
