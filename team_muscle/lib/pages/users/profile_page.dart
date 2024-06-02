import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Controllers
import 'package:team_muscle/controllers/user_controller.dart';

// Widgets
import 'package:team_muscle/widgets/fields/text_field_widget.dart';
import 'package:team_muscle/widgets/navbar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  final controller = UserController();

  @override
  initState() {
    super.initState();
    setState(() {
      controller.setById(globals.userIndex!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.black),
                    onPressed: () {
                      context.goNamed('select_user');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () {
                      context.goNamed('edit_profile');
                    },
                  ),
                ],
              ),
              TextFieldWidget(
                label: 'Name: ',
                hintText: 'Enter your name',
                controller: controller.name,
                isEditable: false,
              ),
              TextFieldWidget(
                label: 'Date of birth: ',
                hintText: 'Enter your date of birth',
                controller: controller.age,
                isEditable: false,
              ),
              TextFieldWidget(
                label: 'Height (cm): ',
                hintText: 'Enter your height in cm',
                controller: controller.height,
                isEditable: false,
              ),
              TextFieldWidget(
                label: 'Weight (kg): ',
                hintText: 'Enter your weight in kg',
                controller: controller.weight,
                isEditable: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          controller.setById(globals.userIndex!);
                        });
                      },
                      icon: const Icon(Icons.update),
                  )
                ]
              )
            ],
          ),
        ),
      ),
        bottomNavigationBar: Container(
          color: Colors.grey[600],
          child: const NavbarWidget(selectedIndex: 2)
        ),
    );
  }
}
