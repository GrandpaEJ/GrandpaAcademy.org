import 'package:flutter/material.dart';

import "sub/homedrawer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          )),
          backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 65,
        ),
      
      backgroundColor: Colors.black,

      drawer: HomeDrawer(),

      body: Center(child: Text('Hello World!')),

    );
  }
}