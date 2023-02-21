import 'package:flutter/material.dart';
import 'package:pokedexflutter/models/pokemon_detail_dto.dart';

class PokemonDetailsPage extends StatelessWidget {
  PokemonDetail pokemon;

  PokemonDetailsPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(pokemon.name ?? ""),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.network(pokemon.sprites?.front_default ?? "")],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? "",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text("Nº${pokemon.id}"),
            ],
          )
        ],
      ),
    );
  }
}
