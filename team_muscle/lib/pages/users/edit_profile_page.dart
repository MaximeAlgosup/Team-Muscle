import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Controllers
import 'package:team_muscle/controllers/user_controller.dart';

// Widgets
import 'package:team_muscle/widgets/fields/text_field_widget.dart';
import 'package:team_muscle/widgets/buttons/simple_button_widget.dart';
import 'package:team_muscle/widgets/fields/number_field_widget.dart';
import 'package:team_muscle/widgets/navbar_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      context.goNamed("profile");
                    },
                  ),
                ],
              ),
              TextFieldWidget(
                label: 'Name: ',
                hintText: 'Enter your name',
                controller: controller.name,
              ),
              NumberFieldWidget(
                label: 'Birth year: ',
                hintText: 'Enter your date of birth',
                controller: controller.age,
              ),
              NumberFieldWidget(
                label: 'Height (cm): ',
                hintText: 'Enter your height in cm',
                controller: controller.height,
              ),
              NumberFieldWidget(
                label: 'Weight (kg): ',
                hintText: 'Enter your weight in kg',
                controller: controller.weight,
              ),
              SimpleButtonWidget(
                  label: 'Save data',
                  onPressed: () {
                    controller.updateUser(globals.userIndex!);
                    context.goNamed("profile");
                  }
              ),
              SimpleButtonWidget(
                label: 'Delete user',
                isWarning: true,
                onPressed: () {
                  controller.deleteUser();
                  context.goNamed('login');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.grey[600], child: const NavbarWidget(selectedIndex: 0)),
    );
  }
}