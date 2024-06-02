import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Models
import 'package:team_muscle/models/exercise_model.dart';

// Tables
import 'package:team_muscle/database/tables/exercise_table.dart';

class SelectExerciseWidget extends StatefulWidget {
  const SelectExerciseWidget({super.key});

  @override
  _SelectExerciseWidgetState createState() => _SelectExerciseWidgetState();
}


class _SelectExerciseWidgetState extends State<SelectExerciseWidget> {

  Future<List<ExerciseModel>> getExercises() async {
    List<ExerciseModel> exercisesList = await exercises();
    // print all users data
    if(kDebugMode) {
      for (int i = 0; i < exercisesList.length; i++) {
        debugPrint("Exercise: ${exercisesList[i].toString()}");
      }
    }
    return exercisesList;
  }

  Future<List<ExerciseModel>> exercisesList = Future.value([]);

  @override
  void initState() {
    super.initState();
    setState(() {
      exercisesList = getExercises();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExerciseModel>>(
      future: exercisesList,
      builder:
          (BuildContext context, AsyncSnapshot<List<ExerciseModel>> exercisesSnapshot) {
        if (exercisesSnapshot.hasData) {
          return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    exercisesList = getExercises();
                  });
                },
                child: ListView.builder(
                  itemCount: exercisesSnapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(exercisesSnapshot.data![index].name),
                        trailing: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            context.goNamed('exercise', queryParameters: {'exerciseId': "${exercisesSnapshot.data![index].id}"});
                          },
                        ),
                      ),
                    );
                  },
                ),
              ));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
