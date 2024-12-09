import 'package:android_nga_flutter/dashboard/dashboard_page.dart';
import 'package:android_nga_flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                    'assets/redlock1.png', // Replace with your image path
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
                    MaterialPageRoute(builder: (_) => DashboardPage()),
                  );
                },
              ),
            ],
          ),

          // Exit menu item
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
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
    );
  }
}
