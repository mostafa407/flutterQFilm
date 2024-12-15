import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/model/show.dart';
late List<Show> allCharacters;
late List<Show> searchAllCharacters;
Widget builSearchField() {
  return TextField(
    decoration: InputDecoration(
        hintText: "find film.....",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
    onChanged: (searchedChanged) {
      addSearchForItemToSearchedList(searchedChanged);
    },
  );
}
  void addSearchForItemToSearchedList(String searchedChanged){
    searchAllCharacters = allCharacters
        .where((character) =>
        character.name!.toLowerCase().startsWith(searchedChanged))
        .toList();
  }