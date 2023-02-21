import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedexflutter/api_response.dart';
import 'dart:convert' as convert;

import 'models/pokemon_detail_dto.dart';
import 'models/pokemon_dto.dart';

class PokemonApi {
  static Future<ApiResponse<Pokemon>> getPokemons() async {
    try {
      var url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20&offset=');
      var response = await http.get(url);

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final pokemon = Pokemon.fromJson(mapResponse);

        return ApiResponse.ok(pokemon);
      } else {
        return ApiResponse.error(mapResponse["error"]);
      }
    } catch (error, exception) {
      print("Erro ao obter pokemons $error > $exception");

      return ApiResponse.error("Não foi possível obter os pokemons");
    }
  }

  static Future<ApiResponse<PokemonDetail>> getDetail(String name) async {
    try {
      var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$name');
      var response = await http.get(url);

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final pokemonDetail = PokemonDetail.fromJson(mapResponse);

        return ApiResponse.ok(pokemonDetail);
      } else {
        return ApiResponse.error(mapResponse["error"]);
      }

    } catch (error, exception) {
      print("Erro ao obter detalhe do pokemon $error > $exception");

      return ApiResponse.error("Não foi possível obter o detalhe do pokemon");
    }
  }

}