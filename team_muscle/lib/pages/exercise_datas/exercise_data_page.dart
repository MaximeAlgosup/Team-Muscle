import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

// Controllers
import "package:team_muscle/controllers/exercise_data_controller.dart";
import "package:team_muscle/widgets/navbar_widget.dart";
import "package:team_muscle/widgets/others/loading_widget.dart";

// Widgets
import "package:team_muscle/widgets/panels/double_data_panel_widget.dart";
import 'package:team_muscle/widgets/panels/round_panel_widget.dart';

class ExerciseDataPage extends StatefulWidget{
  ExerciseDataPage(
      {required this.exerciseDataId,
      required this.exerciseName,
      required this.controller,
      super.key});

  final int exerciseDataId;
  final String exerciseName;
  ExerciseDataController controller;


  @override
  _ExerciseDataPageState createState() => _ExerciseDataPageState(
      exerciseDataId: exerciseDataId,
      exerciseName: exerciseName,
      controller: controller);
}

class _ExerciseDataPageState extends State<ExerciseDataPage> {
  _ExerciseDataPageState({
    required this.exerciseDataId,
    required this.exerciseName,
    required this.controller});

  final int exerciseDataId;
  final String exerciseName;
  final ExerciseDataController controller;
  Widget _body = const LoadingWidget();
  void _setExerciseData() async {
    controller.setById(exerciseDataId).then((value) {
      setState(() {
        _body = buildExerciseDataPage(context);
      });
    });
  }

  @override
  initState() {
    super.initState();
    _setExerciseData();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget buildExerciseDataPage(BuildContext context) {
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
                    context.goNamed('exercise', queryParameters: {
                      'exerciseId': controller.exerciseId.text
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black),
                  onPressed: () {
                    context.goNamed('edit_exo_data', queryParameters: {
                      'exerciseDataId': exerciseDataId.toString(),
                      'exerciseName': exerciseName.toString(),
                      'isPersonalRecord': controller.isPersonalRecord.text,
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              debugPrint("update button is pressed");
                              controller.setById(exerciseDataId);
                            });
                          },
                          icon: const Icon(Icons.update),
                        )
                      ]
                  ),
                ],
              ),
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
