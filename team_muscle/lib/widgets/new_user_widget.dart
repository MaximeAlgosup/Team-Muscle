import 'package:flutter/material.dart';

// Widgets
import 'package:team_muscle/widgets/fields/text_field_widget.dart';
import 'package:team_muscle/widgets/buttons/simple_button_widget.dart';

// Controllers
import 'package:team_muscle/controllers/user_controller.dart';

class NewUserWidget extends StatelessWidget{
  NewUserWidget({super.key});
  final controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFieldWidget(
                label: 'Name: ',
                hintText: 'Enter your name',
                controller: controller.name,
              ),
            TextFieldWidget(
                label: 'Age: ',
                hintText: 'Enter your date of birth',
                controller: controller.age,
              ),
            TextFieldWidget(
                label: 'Height: ',
                hintText: 'Enter your height in cm',
                controller: controller.height,
              ),
            TextFieldWidget(
                label: 'Weight: ',
                hintText: 'Enter your weight in kg',
                controller: controller.weight,
              ),
            SimpleButtonWidget(
                label: 'Save User',
                onPressed: controller.saveUser,
              ),
          ],
        ),
      ),
    );
  }
}