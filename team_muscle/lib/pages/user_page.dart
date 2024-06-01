import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;
import 'package:team_muscle/widgets/buttons/simple_button_widget.dart';

// Widgets
import 'package:team_muscle/widgets/navbar_widget.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/tables/user_table.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  bool _isUser = false;

  Future<void> updateIsUser() async {
      print("Updating isUser");
      final List<UserModel> usersList = await users();
      if (globals.userIndex != null && usersList.isNotEmpty) {
        setState(() {
          _isUser = true;
        });
      } else {
        setState(() {
          _isUser = false;
        });
      }
  }

  Future<List<UserModel>> getUsers() async {
    final List<UserModel> usersList = await users();
    return usersList;
  }

  late AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  late Animation<Alignment> _animation;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      await updateIsUser();
    });
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[600],
        body: GestureDetector(
          onPanDown: (details) {
            // _controller.stop();
          },
          onPanUpdate: (details) {
            setState(() {
              _dragAlignment += Alignment(
                details.delta.dx / (size.width / 2),
                details.delta.dy / (size.height / 2),
              );
            });
          },
          onPanEnd: (details) {
            print("Pad released!");
            updateIsUser();
            _runAnimation(details.velocity.pixelsPerSecond, size);
          },
          child: Align(
            alignment: _dragAlignment,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: size.height * 0.6,
              color: Colors.grey[600],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: IconButtonWidget(
                      label: 'Log In',
                      icon: Icons.login,
                      onPressed: () {
                        context.pushNamed('select_user');
                      },
                    ),
                  ),
                  (_isUser == true)
                      ? Center(
                          child: SimpleButtonWidget(
                          label: "See my profile",
                          onPressed: () {
                            // context.goNamed('profile');
                            print("User index: ${globals.userIndex}");
                          },
                        ))
                      : const Text(""),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[600],
          child: (_isUser == true)
              ? const NavbarWidget(selectedIndex: 2)
              : const Text(""),
        ));
  }
}
