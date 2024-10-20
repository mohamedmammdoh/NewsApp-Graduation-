import 'dart:async';
import 'package:flutter/material.dart';
import '../CustomWidgets/listviewatricles.dart';
import '../Models/articlemodel.dart';
import '../services/NewsService.dart';

class SearchView extends StatefulWidget {
  static const routename = 'search';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String _searchText = '';
  Future<List<ArticleModel>>? _searchResultsFuture;
  Timer? _debounce;
  Map<String, List<ArticleModel>> _searchCache = {};
  static const Duration cacheDuration = Duration(minutes: 5);
  DateTime? _lastFetchTime;

  void _searchNews(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      setState(() {
        _searchText = query;
      });

      if (_searchCache.containsKey(query) &&
          _lastFetchTime != null &&
          DateTime.now().difference(_lastFetchTime!) < cacheDuration) {
        _searchResultsFuture = Future.value(_searchCache[query]);
      } else {
        // Delay before sending the request to avoid hitting rate limits
        await Future.delayed(const Duration(seconds: 1));

        _searchResultsFuture = NewsServices().searchNews(query: _searchText);

        _searchResultsFuture!.then((articles) {
          _lastFetchTime = DateTime.now();
          _searchCache[query] = articles;
        });
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Search...'),
          onChanged: _searchNews,
        ),
      ),
      body: _searchText.isEmpty
          ? const Center(child: Text('Start typing to search...'))
          : FutureBuilder<List<ArticleModel>>(
        future: _searchResultsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching articles.'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListViewArticles(article: snapshot.data!);
          } else {
            return const Center(child: Text('No articles found.'));
          }
        },
      ),
    );
  }
}