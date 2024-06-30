import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

// Controllers
import 'package:team_muscle/controllers/user_controller.dart';

// Widgets
import 'package:team_muscle/widgets/fields/text_field_widget.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';
import 'package:team_muscle/widgets/buttons/back_app_bar_widget.dart';
import 'package:team_muscle/widgets/fields/number_field_widget.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  final controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: BackAppBarWidget(
          onTape: () {
            context.goNamed("login");
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "Add new user",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
              IconButtonWidget(
                label: 'Add User',
                onPressed: () {
                  controller.saveUser();
                  context.goNamed("login");
                },
                icon: Icons.add,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
