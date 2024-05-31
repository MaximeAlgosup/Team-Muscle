import 'package:flutter/material.dart';

// Widgets
import 'package:team_muscle/widgets/navbar_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.grey[600],
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Welcome to User Page!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
        bottomNavigationBar: const NavbarWidget(selectedIndex: 2));
  }
}
