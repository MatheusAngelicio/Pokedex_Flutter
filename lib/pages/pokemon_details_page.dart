import 'package:flutter/material.dart';
import 'package:pokedexflutter/api_response.dart';
import 'package:pokedexflutter/models/pokemon_detail_dto.dart';

import '../models/pokemon_species.dart';
import '../pokemon_api.dart';

class PokemonDetailsPage extends StatefulWidget {
  PokemonDetail pokemon;

  PokemonDetailsPage(this.pokemon);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  String? description;

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    ApiResponse response =
        await PokemonApi.getPokemonSpeciesInfo(widget.pokemon.id.toString());

    if (response.ok) {
      PokemonSpecies species = response.result;
      description = species.flavorTextEntries?.first.flavorText;

      print("ok species>>> $species");
    } else {
      print("erro species>>> $response");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            children: [
              Image.network(widget.pokemon.sprites?.front_default ?? "")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.pokemon.name ?? "",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text("Nº${widget.pokemon.id}"),
              Container(
                margin:
                    EdgeInsets.only(left: 0, top: 16.0, right: 0, bottom: 0),
                child: FutureBuilder<String?>(
                  future: _getPokemonSpecies(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Text(snapshot.data ?? "");
                      } else {
                        return Text(
                            "Erro ao obter informações da espécie do Pokémon.");
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 0, top: 32.0, right: 0, bottom: 0),
                height: 1,
                color: Color(0x5931323B),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 0, top: 32.0, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/peso.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                    Text("PESO"),
                  ],
                ),
              ),
              Container(
                width: 175,
                height: 43,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x19000000)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "${widget.pokemon.weight} kg",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Color(0xe5000000),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<String?> _getPokemonSpecies() async {
    ApiResponse response =
        await PokemonApi.getPokemonSpeciesInfo(widget.pokemon.id.toString());

    if (response.ok) {
      PokemonSpecies species = response.result;
      print("ok species>>> $species");

      return species.flavorTextEntries?.first.flavorText;
    } else {
      print("erro species>>> $response");
    }
  }
}
