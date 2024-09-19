import 'package:bookstore/page/card_page.dart';
import 'package:bookstore/page/home_page.dart';
import 'package:bookstore/page/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});
  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();}
class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    HomePage(),
    ProfilePage(),
    CartPage(),
  ];
  List<Icon> allItems = [
    Icon(Icons.home,color: Colors.white,),
    Icon(Icons.person,color: Colors.white,),
    //Icon(Icons.medication_liquid_outlined,color: Colors.white,),
    Icon(Icons.shopping_cart_outlined,color: Colors.white,)
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color:Colors.cyan,

        buttonBackgroundColor:Colors.cyan,
        index: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {
          });
        },
        items: allItems,
      ),
    );  }
}
