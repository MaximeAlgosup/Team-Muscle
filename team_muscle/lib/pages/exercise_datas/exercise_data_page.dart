import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

// Controllers
import "package:team_muscle/controllers/exercise_data_controller.dart";

// Widgets
import "package:team_muscle/widgets/panels/double_data_panel_widget.dart";
import 'package:team_muscle/widgets/panels/round_panel_widget.dart';

class ExerciseDataPage extends StatelessWidget {
  const ExerciseDataPage(
      {required this.exerciseDataId,
      required this.exerciseName,
      required this.controller,
      super.key});

  final int exerciseDataId;
  final String exerciseName;
  final ExerciseDataController controller;

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
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    context.goNamed('exercise_data_list', queryParameters: {
                      'exerciseId': controller.exerciseId.text
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black),
                  onPressed: () {
                    context.goNamed('edit_exo_data', queryParameters: {
                      'exerciseDataId': exerciseDataId.toString()
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    exerciseName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  RoundPanelWidget(
                    text: "${controller.weight.text} kg",
                    color: Colors.amber[800]!,
                    size: MediaQuery.of(context).size.width * 0.6,
                    textSize: MediaQuery.of(context).size.width * 0.15,
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  DoubleDataPanelWidget(
                    text1:
                        controller.date.text.split(' ')[0].replaceAll("-", "/"),
                    text2: (controller.isPersonalRecord.text == "true")
                        ? "PR"
                        : "",
                    size: MediaQuery.of(context).size.width * 0.8,
                    text1Color: Colors.white,
                    text2Color: Colors.greenAccent,
                    textSize: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  DoubleDataPanelWidget(
                    text1: "${controller.reps.text} reps",
                    text2: "${controller.sets.text} sets",
                    size: MediaQuery.of(context).size.width * 0.8,
                    text1Color: Colors.lightBlueAccent,
                    text2Color: Colors.yellow,
                    textSize: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
