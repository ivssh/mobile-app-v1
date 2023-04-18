import 'package:flutter/material.dart';
import 'package:flutter_starter/screens/addScreen/index.dart';
import 'package:flutter_starter/screens/home/home.dart';
import 'package:flutter_starter/screens/profile/index.dart';
import 'package:flutter_starter/screens/search/index.dart';
import 'package:go_router/go_router.dart';

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
                  context.go(HomeScreen.routeName);
                },
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.home_filled)),
            IconButton(
                onPressed: () {
                  context.go(SearchScreen.routeName);
                },
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  context.go(AddScreen.routeName);
                },
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.add_circle)),
            IconButton(
                onPressed: () {
                  context.go(ProfileScreen.routeName);
                },
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.person))
          ],
        ),
      ),
    );
  }
}
