import 'package:flutter/material.dart';
import 'package:delightfood/navbar.dart';
// import 'package:delightfood/search.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFff9934),
        toolbarHeight: (MediaQuery.of(context).size.height/12),
        automaticallyImplyLeading: false,
          // The search area here
        title: Row(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width/1.35),
              height: (MediaQuery.of(context).size.height/18),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(45)
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width/30),
            ),

            Container(
              child: Ink(
                height: (MediaQuery.of(context).size.height/18),
                decoration: const ShapeDecoration(
                  // color: Colors.white24,
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  iconSize: (MediaQuery.of(context).size.height/32),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            )
          ],


        )
      ),
      // appBar: AppBar(
      //   title: const Text("Delightfood"),
      //   actions: [
      //     IconButton(
      //         onPressed: () => Navigator.of(context)
      //             .push(MaterialPageRoute(builder: (_) => const SearchPage())),
      //         icon: const Icon(Icons.search))
      //   ],
      // ),

      
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Ink(
            //   decoration: const ShapeDecoration(
            //     color: Colors.white24,
            //     shape: CircleBorder(),
            //   ),
            //   child: IconButton(
            //     icon: const Icon(Icons.keyboard_arrow_right_rounded),
            //     iconSize: 38,
            //     color: Colors.black,
            //     onPressed: () {},
            //   ),
            // ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img-one-pan-spaghetti.webp"))
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img-gnocchi.webp"))
                    ),
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
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),

            SizedBox(
              height: 180,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 20,
                  ),
                  
                  Container(
                    width: 160.0,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Resep Ayam Saus Mentega.png")
                      )  
                    ),
                    
                    // child: const Text(
                    //   "Resep Ayam Mentega",
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.amber,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ),

                  Container(
                    width: 20,
                  ),

                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/sausage-fried-rice-with-tomatoes-carrots-shiitake-mushrooms-plate.jpg")
                      )  
                    ),
                  ),

                  Container(
                    width: 20,
                  ),

                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Sate Taichan Fenomenal yang Praktis dan Lezat - Resep _ ResepKoki.jpg")
                      )  
                    ),
                  ),

                  Container(
                    width: 20,
                  ),

                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img-easy-teriyaki.webp")
                      )  
                    ),
                  ),

                  Container(
                    width: 20,
                  ),

                  Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Pempek Ikan Palembang Saus Cuko (Indonesian Fish Cakes).jpg")
                      )  
                    ),
                  ),

                  Container(
                    width: 20,
                  ),
                ],
              ), 
            ),
          ],
        ),

      ),
                            

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}

