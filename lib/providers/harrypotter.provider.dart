import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchCharacters() async {
  final httpPackageUrl =
      Uri.parse('https://potterapi-fedeperin.vercel.app/es/characters');
  final httpPackageInfo = await http.read(httpPackageUrl);
  print(httpPackageInfo);
  final List<dynamic> characters = jsonDecode(httpPackageInfo);
  print(characters);
  return characters;
}

final dataProvider = FutureProvider<List<dynamic>>((ref) async {
  final response = await fetchCharacters(); 
  return response;
});