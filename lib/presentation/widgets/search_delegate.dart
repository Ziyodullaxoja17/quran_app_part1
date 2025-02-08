import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_46home/data/model/surah_search_model.dart';
import 'package:flutter_46home/data/repository/network_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiSearchDelegate extends SearchDelegate<String> {
  // Clears the search query
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  // Closes the search delegate
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  // Fetch and display search results
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<SurahMatchResult>?>(
      future: getSearchResult(pattern: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("something went wrong !"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text(" No result!"));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final match = snapshot.data![index];
            return Card(
              child: ListTile(
                title: Text(match.surah.name),
                subtitle: Text(match.text),
                leading: const Icon(Icons.book),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {},
              ),
            );
          },
        );
      },
    );
  }

// suggestoin uchun maxsus
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text("Start typing to search..."));
    }

    return buildResults(context);
  }

  // Fetch search results from API
  Future<List<SurahMatchResult>?> getSearchResult(
      {required String pattern}) async {
    final url = Uri.parse("${NetworkConstant.searchSurah}/$pattern/all/en");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final finalModel = SurahSearchModel.fromJson(result);

        log("Data fetched successfully");
        log("Data: ${finalModel.data.SurahMatchResultes}");

        return finalModel.data.SurahMatchResultes;
      } else {
        log("Error: API responded with status code ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching search results: $e");
    }

    return [];
  }
}
