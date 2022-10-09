import 'package:flutter/material.dart';
import '../items.dart';
import 'search.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  goFpsearch() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: ((context) => SearchPage())),
    );
  }

  Widget search_components(BuildContext context, i) {
    return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: AssetImage(recipesAll.recipe[i].path), fit: BoxFit.cover)
        ),
        child: ElevatedButton(
          onPressed: () {
            goFpsearch();
          },
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Color(0)),
          child: Text(recipesAll.recipe[i].category, style: TextStyle(fontSize: 24),),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: recipesAll.recipe.length,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: search_components(context, i),
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width >= 720 ? 3 : 2,
            childAspectRatio:
                MediaQuery.of(context).size.height <= 720 ? 1.4 : 0.8));
  }
}
