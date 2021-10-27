// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';

class SearchAdvancedComponent extends StatefulWidget {
  const SearchAdvancedComponent({Key? key}) : super(key: key);

  @override
  _SearchAdvancedComponentState createState() =>
      _SearchAdvancedComponentState();
}

class _SearchAdvancedComponentState extends State<SearchAdvancedComponent> {
  TextEditingController _controllerSearch = TextEditingController();
  var _isSearching = false;
  var listSearch = ['Tarefa', 'Usuario', 'Pessoa', 'Cachorro', 'Passaro'];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    _search(String text, String choose) {
      print('Escolhi o $text e o $choose');
    }

    return Material(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSearching = false;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: width,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        _isSearching = false;
                      });
                    },
                    child: TextFormField(
                      controller: _controllerSearch,
                      onChanged: (text) {
                        print(_controllerSearch.text);
                        setState(() {
                          if (_controllerSearch.text.isEmpty) {
                            _isSearching = false;
                          }
                          _isSearching = true;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            bottomLeft: Radius.zero,
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.zero,
                          )),
                          hintText: 'Buscar',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                FocusManager.instance.primaryFocus?.unfocus();
                                _controllerSearch.text = '';
                                _isSearching = false;
                              });
                            },
                          )),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _isSearching,
                child: Container(
                    height: height * 0.2,
                    color: Colors.grey[200],
                    child: ListView.builder(
                        itemCount: listSearch.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_controllerSearch.text),
                            trailing: ElevatedButton(
                              child: Text(listSearch[index]),
                              onPressed: () {
                                _search(
                                    _controllerSearch.text, listSearch[index]);
                                setState(() {
                                  _isSearching = false;
                                });
                              },
                            ),
                            onTap: () {
                              _search(
                                  _controllerSearch.text, listSearch[index]);

                              setState(() {
                                _isSearching = false;
                              });
                            },
                          );
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
