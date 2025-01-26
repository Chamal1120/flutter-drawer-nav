import 'package:flutter/material.dart';
import 'package:flutter_drawer_nav/main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'How this works?',
            style: TextStyle(
              color: flavor.green,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            '''
              This is using flutter's Drawer widget with GetX's getxController to manage state when changing through the differnt screens. First we create a class for <your_state>Controller extending getxController and instantiat it in the page where we need the state management. We can define properties inside our custom controller class and methods to how to update them. ".obs" is used to make a property observable and ".Obx" widgets can listens for their changes and update instantly. So whatever the widgets we wrap using Obx will reload when a change occur in .obs variables.
            ''',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
