import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({required this.title, required this.onSearch});

  final String title;
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _customTitle(context),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(onSearch: onSearch),
            );
          },
        )
      ],
    );
  }

  Text _customTitle(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Text(
      title,
      style: _theme.textTheme.headline5
          ?.copyWith(color: _theme.colorScheme.onPrimary),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.onSearch}) : super();
  final Function(String) onSearch;

  //clear query
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  //close
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  //on search
  @override
  Widget buildResults(BuildContext context) {
    //Future.delayed is used as a workaround, so that close() works
    Future.delayed(Duration.zero, () {
      close(context, null);
      onSearch(query);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> matchedQueries = _getSuggestions();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: matchedQueries.length,
      itemBuilder: (context, index) {
        final String suggestion = matchedQueries[index];
        return ListTile(
          title: Text(suggestion, style: Theme.of(context).textTheme.bodyText2),
          dense: true,
          onTap: () {
            close(context, null);
            onSearch(suggestion);
          },
        );
      },
    );
  }

  List<String> _getSuggestions() {
    //TODO get dbSuggestions from data bank
    final List<String> dbSuggestions = [
      'Test',
      'Suggestions',
      'Domain',
      'World',
      'Politics'
    ];
    final List<String> matchedQueries = [];
    for (final String suggestion in dbSuggestions) {
      if (suggestion.toLowerCase().contains(query.toLowerCase())) {
        matchedQueries.add(suggestion);
      }
    }
    return matchedQueries;
  }
}
