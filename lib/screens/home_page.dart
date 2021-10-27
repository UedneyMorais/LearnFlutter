// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:learn/main.dart';
import 'package:learn/components/search_advanced_component.dart';
import 'package:learn/screens/search_advanced_page.dart';
import 'package:learn/screens/search_simple_page%20.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var listMenu = ['Search Advanced', 'Seach Simple'];
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    _goToPage(int i) {
      if (i == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchAdvanced()));
      }
      if (i == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchSimple()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn'),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            height: _height * 0.2,
            color: ThemeData().primaryColor,
          ),
          Container(
              height: _height * 0.8,
              color: Colors.amber,
              child: ListView.builder(
                  itemCount: listMenu.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: _width,
                        child: TextButton.icon(
                            onPressed: () {
                              _goToPage(index);
                            },
                            icon: Icon(Icons.pages),
                            label: Text(listMenu[index])),
                      ),
                    );
                  }))
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
