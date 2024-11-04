import 'package:flutter/material.dart';
import 'package:flutter_api/widget/side_menu_drawer/side_menu_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome To Home Screen'),),
      drawer: const SideMenuDrawer(),
    );
  }
}
