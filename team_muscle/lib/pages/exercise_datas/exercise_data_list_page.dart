import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// widgets
import 'package:team_muscle/widgets/selects/select_exercise_record_widget.dart';

class ExerciseDataListPage extends StatelessWidget {
  final int exerciseId;

  const ExerciseDataListPage({
    required this.exerciseId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[600],
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      context.goNamed('exercise', queryParameters: {'exerciseId': "$exerciseId"});
                    },
                  ),
                ],
              ),
              SelectExerciseRecordWidget(
                exerciseId: exerciseId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}