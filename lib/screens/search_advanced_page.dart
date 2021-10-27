// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:learn/components/search_advanced_component.dart';
import 'package:learn/screens/home_page.dart';

class SearchAdvanced extends StatefulWidget {
  const SearchAdvanced({Key? key}) : super(key: key);

  @override
  _SearchAdvancedState createState() => _SearchAdvancedState();
}

class _SearchAdvancedState extends State<SearchAdvanced> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      if (_selectedIndex == 0) {
        print('CAIU NO IF');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print('CAIU NO ELSE');
        BottomSheet(
          onClosing: () {
            //  Do what you wanna do when the bottom sheet closes.
          },
          builder: (context) {
            // should return a widget
            print('caiu aqui');
            return SearchAdvanced();
          },
        );
      }

      print(_selectedIndex);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Advanced'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: ThemeData().primaryColor,
        fixedColor: Colors.black45,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }
}
