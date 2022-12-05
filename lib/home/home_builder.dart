import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom_fonts.dart';
import '../obj_resep.dart';
import '../Loading.dart';
import '../description/resipes_description.dart';
import 'package:http/http.dart' as http;

class InspiringResep extends StatefulWidget {
  const InspiringResep({Key? key}) : super(key: key);

  @override
  _InspiringResepState createState() => _InspiringResepState();
}

class _InspiringResepState extends State<InspiringResep> {

  Widget components(BuildContext context, i) {
    return GestureDetector(
      onTap: () {},
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

class RecommendedResep extends StatefulWidget {
  const RecommendedResep({Key? key}) : super(key: key);

  @override
  State<RecommendedResep> createState() => _RecommendedResepState();
}

class _RecommendedResepState extends State<RecommendedResep> {
  bool _isLoading = false;
  int count = 0;
  
  _RecommendedResepState(){
    getCount();
  }

  void getCount() async {
    final response = await http.get(Uri.parse('http://delight.foundid.my.id/api/resep'));
    final data = jsonDecode(response.body);
    setState(() {
      count = data['data'].length;
    });
    print(count);
  }

  Future fetchResep() async {
    _isLoading = true;
    final response = await http.get(Uri.parse('http://delight.foundid.my.id/api/resep'));

    if (response.statusCode == 200) {
      _isLoading = false;
      return jsonDecode(response.body);
    } else {
      _isLoading = false;
      throw Exception('Failed to load recipe');
    }
  }

  void readDescription(int data) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => RecipesDescription(data))
    );
  }


  Widget components(BuildContext context, i) {
    return Container (
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
      child:
      FutureBuilder(
        future: fetchResep(),
        builder:(context, snapshot) {
          // print(snapshot);
          return _isLoading ? Loading() : Column(
            children: [
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => readDescription(snapshot.data['data'][i]['id']),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height <= 720
                            ? MediaQuery
                            .of(context)
                            .size
                            .height / 2.5
                            : MediaQuery
                            .of(context)
                            .size
                            .height / 6,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                          child: Image.network('http://delight.foundid.my.id/storage/recipes/${snapshot.data['data'][i]['gambar']}',fit: BoxFit.cover)                        
                        ),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(8),
                        //     image: DecorationImage(image: AssetImage(
                        //         'assets/images/${snapshot.data['data'][i]['gambar']}'), fit: BoxFit.cover)
                        // ),
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2.3,
                          child: Text(
                            snapshot.data['data'][i]['nama'],
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
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
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
