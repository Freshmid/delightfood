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
          height: 45,
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
            height: 45,
            decoration: const ShapeDecoration(
              // color: Colors.white24,
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              iconSize: 30,
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}


