import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchableAppBar extends StatefulWidget {
  @override
  _SearchableAppBarState createState() => _SearchableAppBarState();
}

class _SearchableAppBarState extends State<SearchableAppBar> {
  bool isSearched = false;
  final searchTextController = TextEditingController();

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearched = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearched = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  List<Widget> buildAppBarActions() {
    if (isSearched) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearched
            ? TextField(
          controller: searchTextController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        )
            : const Text('Searchable App Bar'),
        actions: buildAppBarActions(),
      ),
      body: Center(
        child: const Text('Search something!'),
      ),
    );
  }
}
