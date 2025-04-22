// Entry point
import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/config/routes/app_routes.dart';

var screenWidth;
var screenHeight;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp.router(
      routerConfig: router,

      debugShowCheckedModeBanner: false,
    );
  }
}
