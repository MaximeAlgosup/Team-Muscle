import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Widgets
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Welcome to Team Muscle',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            const SizedBox(height: 20),
            IconButtonWidget(
                label: 'Login',
                icon: Icons.person,
                onPressed: () {
                  context.goNamed('user');
                }),
          ],
        ),
      ),
    );
  }
}
