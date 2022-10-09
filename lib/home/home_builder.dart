import 'package:flutter/material.dart';
import 'custom_fonts.dart';
import '../items.dart';

class InspiringItems extends StatefulWidget {
  const InspiringItems({Key? key}) : super(key: key);

  @override
  _InspiringItemsState createState() => _InspiringItemsState();
}

class _InspiringItemsState extends State<InspiringItems> {
  // final dataCar = <Widget>[];
  // _InspiringItemsState() {
  //   for (var i = 0; i < recipesAll.recipe.length; i++) {
  //     dataCar.add(Container(
  //       padding: EdgeInsets.all(4.0),
  //       width: 200,
  //       height: 200,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: GestureDetector(
  //         // onTap: ,
  //         child: Image.asset(
  //           recipesAll.recipe[i].path,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ));
  //   }
  // }

  Widget components(BuildContext context, i) {
    return GestureDetector(
      // onTap: ,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(recipesAll.recipe[i].path), fit: BoxFit.cover),
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

class RecommendedItems extends StatefulWidget {
  const RecommendedItems({Key? key}) : super(key: key);

  @override
  State<RecommendedItems> createState() => _RecommendedItemsState();
}

class _RecommendedItemsState extends State<RecommendedItems> {
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
                  // onTap: ,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height <= 720
                        ? MediaQuery.of(context).size.height / 2.5
                        : MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: AssetImage(recipesAll.recipe[i].path),fit: BoxFit.cover)
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