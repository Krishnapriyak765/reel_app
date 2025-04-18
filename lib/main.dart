// Entry point
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winngoo_reels_app/config/routes/app_routes.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/provider.dart';

var screenWidth;
var screenHeight;

void main() => runApp(MyApp());

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => LoginProvider(),
//       child: MaterialApp.router(
//         routerConfig: router,
//         debugShowCheckedModeBanner: false,
//       ),
//     ),
//   );
// }

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
