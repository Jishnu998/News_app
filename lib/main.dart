import 'package:flutter/material.dart';
import 'package:news_app/screens/bottom%20nav.dart';
import 'package:news_app/screens/splash.dart';
import 'package:provider/provider.dart';
import 'controller/bottom nav controller.dart';
import 'controller/category controller.dart';
import 'controller/home screen controller.dart';
import 'controller/search screen controller.dart';
import 'controller/splash controller.dart';

void main() {
  runApp(MyAppl());
}

class MyAppl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SplashScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryController(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context, splashScreenProvider, _) {
              return splashScreenProvider.isLoading
                  ? SplashScreen()
                  : MainPage(); // Replace with your home screen
            },
          ),
        ));
  }
}