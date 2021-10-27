// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SearchSimple extends StatefulWidget {
  const SearchSimple({Key? key}) : super(key: key);

  @override
  _SearchSimpleState createState() => _SearchSimpleState();
}

class _SearchSimpleState extends State<SearchSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Simple Advanced'),
      ),
    );
  }
}
