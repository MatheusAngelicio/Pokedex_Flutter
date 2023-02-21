import 'package:flutter/material.dart';
import 'package:pokedexflutter/models/pokemon_detail_dto.dart';

class PokemonDetailsPage extends StatelessWidget {
  PokemonDetail pokemon;

  PokemonDetailsPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? ""),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Image.network(pokemon.sprites?.front_default ?? ""),
    );
  }

}
