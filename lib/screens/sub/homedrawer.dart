import 'package:flutter/material.dart';

import 'package:manhwarecaptop/utils/toast.dart';


class HomeDrawer extends StatelessWidget {
	const HomeDrawer({super.key});
	@override
	Widget build(BuildContext context){
    return Drawer(
      child: ListView(

        children: [
          UserAccountsDrawerHeader(
            accountName: Text("GrandpaAcademy"),
            accountEmail: Text("grandpaacademy@grandpaacademy.org"),
          ), 

          ListTile(title: Text("Tutorial"), onTap: () => Toast.show(context, message:"Home", position: ToastPosition.top),),
          ListTile(title: Text("Settings"), onTap: (){Navigator.pushNamed(context,"/about");}),
        ]
    ),);
  }

}