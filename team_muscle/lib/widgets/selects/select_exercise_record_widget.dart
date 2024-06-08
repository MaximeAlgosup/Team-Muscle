import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Models
import 'package:team_muscle/models/exercise_data_model.dart';

// Tables
import 'package:team_muscle/database/tables/exercise_data_table.dart';

class SelectExerciseRecordWidget extends StatefulWidget {
  final int exerciseId;
  final int userId = (globals.userIndex == null) ? 1 : globals.userIndex!;

  SelectExerciseRecordWidget({required this.exerciseId, super.key});

  @override
  State<SelectExerciseRecordWidget> createState() =>
      _SelectExerciseRecordWidgetState(exerciseId: exerciseId, userId: userId);
}

class _SelectExerciseRecordWidgetState
    extends State<SelectExerciseRecordWidget> {
  final int exerciseId;
  final int userId;

  _SelectExerciseRecordWidgetState(
      {required this.exerciseId, required this.userId});

  Future<List<ExerciseDataModel>> getExerciseData() async {
    List<ExerciseDataModel> exerciseDataList =
        await exerciseDatasByUserAndExerciseId(exerciseId, userId);
    // print all users data
    if (kDebugMode) {
      for (int i = 0; i < exerciseDataList.length; i++) {
        debugPrint("Exercise Data: ${exerciseDataList[i].toString()}");
      }
    }
    return exerciseDataList;
  }

  Future<List<ExerciseDataModel>> exerciseDataList = Future.value([]);

  @override
  void initState() {
    super.initState();
    setState(() {
      exerciseDataList = getExerciseData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExerciseDataModel>>(
      future: exerciseDataList,
      builder: (BuildContext context,
          AsyncSnapshot<List<ExerciseDataModel>> exerciseDataSnapshot) {
        if (exerciseDataSnapshot.hasData) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  exerciseDataList = getExerciseData();
                });
              },
              child: ListView.builder(
                itemCount: exerciseDataSnapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: (exerciseDataSnapshot.data![index].isPersonalRecord == true)? Colors.green : Colors.white,
                    child: ListTile(
                      title:
                      Text("${exerciseDataSnapshot.data![index].date.toString().split(' ')[0].replaceAll("-", "/")} - ${exerciseDataSnapshot.data![index].weight} kg"),
                      trailing: IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {
                          context.goNamed('exercise_data', queryParameters: {"exerciseDataId": exerciseDataSnapshot.data![index].id.toString()});
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return GestureDetector(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[600],
              color: Colors.white,
              semanticsLabel: 'Loading exercise data',
            ),
            onHorizontalDragDown: (details) {
              setState(() {
                exerciseDataList = getExerciseData();
              });
            },
          );
        }
      },
    );
  }
}
