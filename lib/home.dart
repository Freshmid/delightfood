import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget> [ 
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
            height: 20,
          ),

          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFFDAF61),
                  Color.fromARGB(255, 250, 209, 169),
                ],
              ),
            )
          ),

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
      );
  }
}

