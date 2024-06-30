import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Controllers
import 'package:team_muscle/controllers/user_controller.dart';

// Widgets
import 'package:team_muscle/widgets/navbar_widget.dart';
import 'package:team_muscle/widgets/others/loading_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = UserController();
  Widget _body = const LoadingWidget();

  void _setUserData() async {
    controller.setById(globals.userIndex!).then((value) {
      setState(() {
        _body = buildProfilePage(context);
      });
    });
  }

  @override
  initState() {
    super.initState();
    _setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget buildProfilePage(BuildContext context) {
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
                    icon: const Icon(Icons.logout, color: Colors.black),
                    onPressed: () {
                      context.goNamed('login');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () {
                      context.goNamed('edit_profile');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.name.text,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.badge,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: Text(
                          controller.age.text,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.height,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: Text(
                         "${ controller.height.text} cm",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.monitor_weight,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: Text(
                          "${ controller.weight.text} kg",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
      ),
      bottomNavigationBar: Container(
          color: Colors.grey[600], child: const NavbarWidget(selectedIndex: 2)),
    );
  }
}
