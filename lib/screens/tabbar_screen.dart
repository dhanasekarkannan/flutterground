import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class TabBarScreen extends StatelessWidget {
  static const String routname = '/tabbar_screen';

  final List<Tab> tabs = [Tab(text: 'Left'), Tab(text: 'Right')];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar"),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: tabs.map((Tab tab) {
            final String label = tab.text.toLowerCase();
            return Center(
              child: Text(
                'this is the $label text!!',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
        drawer: DrawerWidget(),
      ),
    );
  }
}
