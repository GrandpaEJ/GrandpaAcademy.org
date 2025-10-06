import 'package:flutter/material.dart';

// import 'screens/homepage.dart';
import 'screens/root.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (true) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: HomePage()
      home: Root(),
    );
  }}
  // } else {
  //     return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       // home: HomePage()
  //       home: Root(),
  //     );
  //   }
  // }
}

