import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../controller/splash controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size=constantsize(context);

    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(Duration(seconds: 5), () {
      splashScreenProvider.setLoading(false);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "NEWS TODAY",
              style: GoogleFonts.abrilFatface(
                  fontSize: size*35, color: widgetcolor),
            ),

          ],
        ),
      ),
    );
  }
}
