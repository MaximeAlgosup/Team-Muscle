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
import 'package:team_muscle/widgets/others/loading_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final controller = UserController();
  Widget _body = const LoadingWidget();

  void _setUserData() async {
    controller.setById(globals.userIndex!).then((value) {
      setState(() {
        _body = buildUserEditPage(context);
      });
    });
  }

  @override
  initState() {
    super.initState();
    _setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget buildUserEditPage(BuildContext context) {
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
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "Edit ${controller.name.text}'s profile",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
                  label: 'Save',
                  onPressed: () {
                    controller.updateUser(globals.userIndex!);
                    context.goNamed("profile");
                  }
              ),
              SimpleButtonWidget(
                label: 'Delete',
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
          color: Colors.grey[600], child: const NavbarWidget(selectedIndex: 2)),
    );
  }
}