import 'package:ecom_app/screens/feature_screens/cart_screen.dart';
import 'package:ecom_app/screens/feature_screens/favourite_screen.dart';
import 'package:ecom_app/screens/feature_screens/menu_screen.dart';
import 'package:ecom_app/screens/profile_screen.dart';
import 'package:ecom_app/starting_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    required this.index,
  });
  int index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screen = [
    StartingScreen(),
    const FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[widget.index],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
         color: Colors.blue
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'You',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
          currentIndex: widget.index,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              widget.index = value;
            });
          },
          backgroundColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
