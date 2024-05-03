import 'package:flutter/material.dart';

import '../screens/catogary screen.dart';
import '../screens/home screen.dart';
import '../screens/search screen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 0;
  void onItemTap(index){
    selectedIndex = index;
    notifyListeners();
  }
  List<Widget> myPages =[
    HomeScreen(),CategoryScreen(),SearchScreen()
  ];
}