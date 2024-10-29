import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<dynamic>> fetchCharacters() async {
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Check if characters data already exists in shared preferences.
  final String? savedCharacters = prefs.getString('characters');

  if (savedCharacters != null) {
    // If data exists, decode and return it.
    print("Loading characters from cache...");
    return jsonDecode(savedCharacters);
  } else {
    // If no data, fetch from the API.
    final Uri httpPackageUrl =
        Uri.parse('https://potterapi-fedeperin.vercel.app/es/characters');
    final String httpPackageInfo = await http.read(httpPackageUrl);

    // Decode JSON and save to shared preferences.
    final List<dynamic> characters = jsonDecode(httpPackageInfo);
    await prefs.setString('characters', jsonEncode(characters));

    print("Characters fetched from API and saved to cache.");
    return characters;
  }
}

final dataProvider = FutureProvider<List<dynamic>>((ref) async {
  final response = await fetchCharacters(); 
  return response;
});