import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List list;
  Search(this.list);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> suggestions = [];
    for (var items in list) {
      if (items[0].toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(items[0]);
      }
    }
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          var resultat = suggestions[index];
          return ListTile(
            title: Text(resultat),
            onTap: () {
              
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [];
    for (var items in list) {
      if (items[0].toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(items[0]);
      }
    }
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          var resultat = suggestions[index];
          return ListTile(
            title: Text(resultat),
          );
        });
  }
}
