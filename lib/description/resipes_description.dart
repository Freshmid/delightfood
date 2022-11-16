import 'package:flutter/material.dart';
import 'givestars.dart';
import '../obj_resep.dart';

class RecipesDescription extends StatefulWidget {
  const RecipesDescription({Key? key}) : super(key: key);

  @override
  _RecipesDescriptionState createState() => _RecipesDescriptionState();
}

class _RecipesDescriptionState extends State<RecipesDescription> {
  double rating = 3.5;

  // @override
  // Widget build(BuildContext context) {
  //   return StarRating(
  //     rating: rating,
  //     onRatingChanged: (rating) => setState(() => this.rating = rating), color: Colors.orange,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff9934),
        title: Text(
          recipesAll.recipe[2].title,
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(recipesAll.recipe[2].image),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  recipesAll.recipe[2].description,
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
