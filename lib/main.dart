import 'package:flutter/material.dart';
import 'package:flutter_drawer_nav/screens/about.dart';
import 'package:flutter_drawer_nav/screens/home.dart';
import 'package:flutter_drawer_nav/screens/settings.dart';
import 'package:get/get.dart';
import 'package:flutter_drawer_nav/controllers/nav_controller.dart';
import 'package:catppuccin_flutter/catppuccin_flutter.dart';

// Create flavor object for accessing colors from catppuccin_flutter package
Flavor flavor = catppuccin.mocha;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer Demo',

      // Define the dark theme
      darkTheme: ThemeData(
        listTileTheme: ListTileThemeData(
          iconColor: flavor.text,
          textColor: flavor.text,
        ),
        drawerTheme: DrawerThemeData(
          width: 250.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0.0),
              topLeft: Radius.circular(0.0),
            )
          ),
          scrimColor: flavor.crust,
          shadowColor: flavor.crust,
          backgroundColor: flavor.surface0,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: flavor.text,
          ),
          bodyMedium: TextStyle(
            color: flavor.text,
          ),
          bodySmall: TextStyle(
            color: flavor.text,
          ),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: flavor.text,
          ),
            actionsIconTheme: IconThemeData(
            color: flavor.text,
          ),
            backgroundColor: flavor.base,
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              color: flavor.text,
            )),
        scaffoldBackgroundColor: flavor.base,
      ),

      // Force dark theme
      themeMode: ThemeMode.dark,
      home: MainView(),
    );
  }
}

// Display drawer and control other screens
class MainView extends StatelessWidget {
 
  // Create NavController object
  final NavController navController = Get.put(NavController());
 
  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // Wrap with Obx Widget to listen for changes in selectedPage and update
        title: Obx(() => Text(navController.selectedPage.value)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 60.0),
              decoration: BoxDecoration(color: flavor.base),
              child: Text(
                'Navigation Drawer :)',
                style: TextStyle(
                  color: flavor.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                navController.changePage('Home');
                Get.back(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                navController.changePage('Settings');
                Get.back(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                navController.changePage('About');
                Get.back(); // Close the drawer
              },
            ),
          ],
        ),
      ),

      // Wrap with Obx widget to listen for changes in selectedPage and update
      body: Obx(() {
        switch (navController.selectedPage.value) {
          case 'Home':
            return Center(child: Home());
          case 'Settings':
            return Center(child: Settings());
          case 'About':
            return Center(child: About());
          default:
            return Center(child: Text('Unknown Page'));
        }
      }),
    );
  }
}
