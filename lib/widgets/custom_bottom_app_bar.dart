import 'package:flutter/material.dart';
import 'package:flutter_starter/screens/addScreen/index.dart';
import 'package:flutter_starter/screens/home/home.dart';
import 'package:flutter_starter/screens/profile/index.dart';
import 'package:flutter_starter/screens/search/index.dart';


class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, HomeScreen.routeName);
              },
              color: Colors.white,
              iconSize: 30, 
              icon: const Icon(Icons.home_filled)
            ),
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, SearchScreen.routeName);
              },
              color: Colors.white,
              iconSize: 30, 
              icon: const Icon(Icons.search)
            ),
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AddScreen.routeName);
              },
              color: Colors.white,
              iconSize: 30, 
              icon: const Icon(Icons.add_circle)
            ),
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, ProfileScreen.routeName);
              },
              color: Colors.white,
              iconSize: 30, 
              icon: const Icon(Icons.person)
            )
          ],
        ),
      ),
    );
  }
}
