import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  _NavbarWidgetState createState() => _NavbarWidgetState(this.selectedIndex);
}

class _NavbarWidgetState extends State<NavbarWidget> {
  _NavbarWidgetState(this._selectedIndex);
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Exercises',
      style: optionStyle,
    ),
    Text(
      'Index 1: Body data',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 0) {
        context.goNamed('exercise_list');
      } else if(index == 1) {
        return;
      } else if(index == 2) {
        context.goNamed('profile');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[800],
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center, size: 40),
              label: 'Exercises',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new, size: 40),
              label: 'Body data',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 40),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
