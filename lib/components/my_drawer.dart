import 'package:android_nga_flutter/dashboard/dashboard.dart';
import 'package:android_nga_flutter/entity/userModel.dart';
import 'package:android_nga_flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final User currentUser; // Add currentUser parameter

  const MyDrawer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 140, 219, 224),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/Background.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Drawer header and menu items
            Column(
              children: [
                // Header - Replace lock icon with Image
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      'assets/l.png', // Replace with your image path
                      width: 390, // Adjust size as needed
                      height: 390, // Adjust size as needed
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Dashboard menu item
                MyListTile(
                  text: "Dashboard",
                  
                  icon: Icons.dashboard,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(
                            currentUser:
                                currentUser), // Pass currentUser to Dashboard
                      ),
                    );
                  },
                ),
              ],
            ),

            // Exit menu item
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
                text: "Logout",
                icon: Icons.logout,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Login()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
