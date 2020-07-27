import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:smartdex/Models/pokemon.dart';
import 'dart:async';

class Services {

  static Future<List<Pokemon>> getPokemons() async {

    dynamic response;

    response = await rootBundle.loadString('assets/Pokedex.json');
    List<Pokemon> list = parsePokemons(response);
    return list;
  }

  static List<Pokemon> parsePokemons(String response) {
    final parsed = json.decode(response).cast<Map<String, dynamic>>();
    return parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  }
}