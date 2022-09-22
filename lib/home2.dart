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

      
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget> [ 
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
            height: 40,
          ),

          SizedBox(
            height: 100,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 10,
                ),
                
                Container(
                  width: 140.0,
                  // color: Colors.brown,
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
                  width: 10,
                ),

                Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/sausage-fried-rice-with-tomatoes-carrots-shiitake-mushrooms-plate.jpg")
                    )  
                  ),
                ),

                Container(
                  width: 10,
                ),

                Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/Sate Taichan Fenomenal yang Praktis dan Lezat - Resep _ ResepKoki.jpg")
                    )  
                  ),
                ),

                Container(
                  width: 10,
                ),

                Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/img-easy-teriyaki.webp")
                    )  
                  ),
                ),

                Container(
                  width: 10,
                ),

                Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/Pempek Ikan Palembang Saus Cuko (Indonesian Fish Cakes).jpg")
                    )  
                  ),
                ),

                Container(
                  width: 10,
                ),
              ],
            ), 
          ),

          Container(
            height: 40,
          ),

          // Container(
          //   decoration: const BoxDecoration(
          //     color: Colors.black12
          //   ),
          //   child: SizedBox(
          //     child: Row(
          //       children: [

          //         Container(
          //           width: 10,
          //         ),

          //         Container(
          //           height: 100,
          //           width: 200.0,
          //           // color: Colors.brown,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8),
          //             image: const DecorationImage(
          //               fit: BoxFit.cover,
          //               image: AssetImage("assets/images/img-easy-teriyaki.webp")
          //             )  
          //           ),
          //         ),

          //         Container(
          //           width: 20,
          //         ),

          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               height: 10,
          //             ),
          //             Ink(
          //               height: (MediaQuery.of(context).size.height/18),
          //               decoration: const ShapeDecoration(
          //                 // color: Colors.white24,
          //                 color: Colors.brown,
          //                 shape: CircleBorder(),
          //               ),
          //               child: IconButton(
          //                 icon: const Icon(Icons.person),
          //                 iconSize: (MediaQuery.of(context).size.height/32),
          //                 color: Colors.black,
          //                 onPressed: () {},
          //               ),
          //             ),

          //             Container(
          //               height: 10,
          //             ),

          //             const SizedBox(
          //               width: 100,
          //               child: Text(
          //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          //                 overflow: TextOverflow.ellipsis,
          //               )
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          
          Container(
            height: 8,
          ),


          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                    ),
                    
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      decoration: BoxDecoration(
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Colors.black26,
                      //     offset: Offset(
                      //       5.0,
                      //       5.0,
                      //     ),
                      //     blurRadius: 10.0,
                      //     spreadRadius: 2.0,
                      //   ), //BoxShadow
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     offset: Offset(0.0, 0.0),
                      //     blurRadius: 0.0,
                      //     spreadRadius: 0.0,
                      //   ), //BoxShadow
                      // ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            // color: Colors.brown,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img-easy-teriyaki.webp")
                              )  
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Ink(
                                height: (MediaQuery.of(context).size.height/18),
                                decoration: const ShapeDecoration(
                                  // color: Colors.white24,
                                  color: Colors.brown,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.person),
                                  iconSize: (MediaQuery.of(context).size.height/32),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),

                              Container(
                                height: 10,
                              ),

                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            // color: Colors.brown,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img-easy-teriyaki.webp")
                              )  
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Ink(
                                height: (MediaQuery.of(context).size.height/18),
                                decoration: const ShapeDecoration(
                                  // color: Colors.white24,
                                  color: Colors.brown,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.person),
                                  iconSize: (MediaQuery.of(context).size.height/32),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),

                              Container(
                                height: 10,
                              ),

                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            height: 16,
          ),

          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                    ),
                    
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            // color: Colors.brown,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img-easy-teriyaki.webp")
                              )  
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Ink(
                                height: (MediaQuery.of(context).size.height/18),
                                decoration: const ShapeDecoration(
                                  // color: Colors.white24,
                                  color: Colors.brown,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.person),
                                  iconSize: (MediaQuery.of(context).size.height/32),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),

                              Container(
                                height: 10,
                              ),

                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            // color: Colors.brown,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img-easy-teriyaki.webp")
                              )  
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Ink(
                                height: (MediaQuery.of(context).size.height/18),
                                decoration: const ShapeDecoration(
                                  // color: Colors.white24,
                                  color: Colors.brown,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.person),
                                  iconSize: (MediaQuery.of(context).size.height/32),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),

                              Container(
                                height: 10,
                              ),

                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 16,
          ),

          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                    ),
                    
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            // color: Colors.brown,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img-easy-teriyaki.webp")
                              )  
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Ink(
                                height: (MediaQuery.of(context).size.height/18),
                                decoration: const ShapeDecoration(
                                  // color: Colors.white24,
                                  color: Colors.brown,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.person),
                                  iconSize: (MediaQuery.of(context).size.height/32),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),

                              Container(
                                height: 10,
                              ),

                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            // color: Colors.brown,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img-easy-teriyaki.webp")
                              )  
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Ink(
                                height: (MediaQuery.of(context).size.height/18),
                                decoration: const ShapeDecoration(
                                  // color: Colors.white24,
                                  color: Colors.brown,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.person),
                                  iconSize: (MediaQuery.of(context).size.height/32),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),

                              Container(
                                height: 10,
                              ),

                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 20,
          ),
        ],
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

