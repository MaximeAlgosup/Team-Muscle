import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

// Controllers
import 'package:team_muscle/controllers/user_controller.dart';

// Widgets
import 'package:team_muscle/widgets/fields/text_field_widget.dart';
import 'package:team_muscle/widgets/buttons/simple_button_widget.dart';
import 'package:team_muscle/widgets/buttons/back_app_bar_widget.dart';
import 'package:team_muscle/widgets/fields/number_field_widget.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/database/tables/user_table.dart';

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
                label: 'Save User',
                onPressed: () {
                  controller.saveUser();
                  context.goNamed("login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
