import 'package:flutter/material.dart';

class BaseAppBar extends StatefulWidget {
  const BaseAppBar({ Key? key }) : super(key: key);

  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                  hintText: "Cari Resep...",
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
    );
  }
}


