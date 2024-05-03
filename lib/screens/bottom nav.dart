import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../controller/bottom nav controller.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size=constantsize(context);
    return Scaffold(
      body:Provider.of<BottomNavController>(context).myPages[
      Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(padding: EdgeInsets.all(size*20),
        child: Container(padding: EdgeInsets.all(size*5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(size*15),
              color: Colors.white,border: Border.all(color: widgetcolor)),
          child:BottomNavigationBar(
              currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
              onTap: Provider.of<BottomNavController>(context, listen:false).onItemTap,
              elevation:0,
              backgroundColor:Colors.white,
              selectedIconTheme:IconThemeData(color: widgetcolor,size: size*25),
              unselectedIconTheme:IconThemeData(size: size*25),
              unselectedItemColor: Colors.grey,
              selectedItemColor: widgetcolor,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items:[
                BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
                BottomNavigationBarItem(icon:Icon(Icons.category),label:"Category"),
                BottomNavigationBarItem(icon:Icon(Icons.search),label:"Search"),
              ]
          ) ,),),
    );
  }
}
