import 'package:flutter/material.dart';

class Rootdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 93, 64, 99),const Color.fromARGB(255, 119, 68, 68), Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer header (optional if you want to add something at the top)
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Divider(color: Colors.white),  // Separator between header and items

            // Drawer menu items
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                // Handle Home tap
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text(
                'About',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                // Handle About tap
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.white),
              title: Text(
                'Contact',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                // Handle Contact tap
              },
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.white),
              title: Text(
                'Courses',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                // Handle Courses tap
              },
            ),
            Divider(color: Colors.white),  // Another separator
            
          ],
        ),
      ),
    );
  }
}
