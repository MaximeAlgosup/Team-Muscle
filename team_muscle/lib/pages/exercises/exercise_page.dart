import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Widgets
import 'package:team_muscle/widgets/buttons/back_app_bar_widget.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({
    required this.exerciseId,
    super.key});

  final String exerciseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: BackAppBarWidget(
          onTape: () {
            context.goNamed("exercise_list");
          },
        ),
      ),
      body: Center(
        child: Text('Exercise Page'),
      ),
    );
  }
}

