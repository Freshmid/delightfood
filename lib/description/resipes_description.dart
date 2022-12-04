import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'givestars.dart';
// import '../obj_resep.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Loading.dart';

class RecipesDescription extends StatefulWidget {
  final int id;
  const RecipesDescription(this.id, {Key? key}) : super(key: key);

  @override
  _RecipesDescriptionState createState() => _RecipesDescriptionState();
}

class _RecipesDescriptionState extends State<RecipesDescription> {
  bool _isLoading = false;
  double rating = 3.5;
  // int get_id = 0;

  // @override
  // Widget build(BuildContext context) {
  //   return StarRating(
  //     rating: rating,
  //     onRatingChanged: (rating) => setState(() => this.rating = rating), color: Colors.orange,
  //   );
  // }

  Future getResep(id) async {
    _isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    final response = await http.get(Uri.parse('http://delight.foundid.my.id/api/detail-resep?id=$id'));
    // final response = await http.get(Uri.parse('http://delight.foundid.my.id/api/detail-resep?id=${prefs.getInt('user_id')}'));
    print(id);
    // setState(() {
    //   get_id = id;
    // });
    if (response.statusCode == 200) {
      _isLoading = false;
      return jsonDecode(response.body);
    } else {
      _isLoading = false;
      throw Exception('Failed to load recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getResep(widget.id),
      builder:(context, snapshot) {
        return _isLoading ? Loading() :  Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFff9934),
            title: Text(
              snapshot.data['data']['nama'],
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 255, 242, 224)),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Image.network('http://delight.foundid.my.id/storage/recipes/${snapshot.data['data']['gambar']}',fit: BoxFit.cover)
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage('assets/images/${snapshot.data['data']['gambar']}'),
                    //         fit: BoxFit.cover)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      snapshot.data['data']['deskripsi'],
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                        child: StarRating(
                      onRatingChanged: (rating) =>
                          setState(() => this.rating = rating),
                      color: Colors.orange,
                    )),
                  ),
                  inputComment()
                ]),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget inputComment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Your Comment",
        //   style: TextStyle(
        //       fontSize: 16,
        //       color: Color(0xFFE7872C),
        //       fontWeight: FontWeight.bold
        //   ),
        // ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black26,
              //       blurRadius: 6,
              //       offset: Offset(0,2)
              //   )
              // ]
          ),
          height: 140,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.comment,
                    color: Color(0xFFE7872C)
                ),
                hintText: 'Your Comment...',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }


}
