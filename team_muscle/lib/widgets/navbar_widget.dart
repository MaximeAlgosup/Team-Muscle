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
        return;
      } else if(index == 1) {
        return;
      } else if(index == 2) {
        context.goNamed('user');
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Exercises',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new),
              label: 'Body data',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
