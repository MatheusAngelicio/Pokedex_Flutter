import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedexflutter/api_response.dart';
import 'package:pokedexflutter/models/pokemon_detail_dto.dart';
import 'package:pokedexflutter/models/pokemon_dto.dart';

import '../pokemon_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final _streamController = StreamController<List<PokemonDetail>>();
  List<PokemonDetail> detailList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Pokemons")), body: _body());
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    ApiResponse response = await PokemonApi.getPokemons();

    if (response.ok) {
      Pokemon pokemons = response.result;
      List<Results> pokemonList = pokemons.results ?? List.empty();

      Future.wait(pokemonList.map((pokemon) async {
        ApiResponse response2 = await PokemonApi.getDetail(pokemon.name ?? "");

        if(response2.ok) {

          PokemonDetail detail = response2.result;
          detailList.add(detail);

          _streamController.add(detailList);
          print("ok detail >>> $detail");

        } else {
          print("erro detail >>> $response");

        }
      }));

      print("ok >>> $pokemons");
    } else {
      print("erro >>> $response");
    }
  }

  _body() {
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Não foi possível buscar os pokemons",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<PokemonDetail>? pokemons = snapshot.data;
        return _listView(pokemons ?? List.empty());
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _streamController.close();
  }

  _listView(List<PokemonDetail> pokemos) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: pokemos.length,
          itemBuilder: (context, index) {
            PokemonDetail pokemon = pokemos[index];

            return Card(
              color: Colors.grey[100],
              child: Text(pokemon.id.toString() ?? ""),
            );
          },
        ));
  }
}
