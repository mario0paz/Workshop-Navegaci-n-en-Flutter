import 'package:flutter/material.dart';
import 'package:Workshop-Navegaci-n-en-Flutter/components/drawer_component.dart';
import 'package:Workshop-Navegaci-n-en-Flutter/components/image_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
            ],
          ),
        ),
        drawer: const DrawerComponent(),
        body: const TabBarView(
          children: [
            Center(child: TabImage(title: 'Tab 1', tabIndex: 0)),
            Center(child: TabImage(title: 'Tab 2', tabIndex: 1)),
            Center(child: TabImage(title: 'Tab 3', tabIndex: 2)),
          ],
        ),
      ),
    );
  }
}
