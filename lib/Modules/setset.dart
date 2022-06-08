import 'package:ashour/Modules/category/Category/category_screen.dart';
import 'package:ashour/Modules/home/home_screen.dart';
import 'package:ashour/Modules/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class SetScreen extends StatefulWidget {
  const SetScreen({Key? key}) : super(key: key);

  @override
  State<SetScreen> createState() => _SetScreenState();
}
class _SetScreenState extends State<SetScreen> {
  var CurrentIndex = 0;
  final Screens = [
    HomeScreen(),
    ProfileScreen(),
    CategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Screens[CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          CurrentIndex = index;
        }),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: CurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
