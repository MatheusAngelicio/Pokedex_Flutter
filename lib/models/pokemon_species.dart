class PokemonSpecies {

  List<FlavorTextEntries>? flavorTextEntries;

  PokemonSpecies(this.flavorTextEntries);

  PokemonSpecies.fromJson(Map<dynamic, dynamic> json) {
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(new FlavorTextEntries.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'PokemonSpecies{flavorTextEntries: $flavorTextEntries}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] = this.flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class FlavorTextEntries {
  String? flavorText;

  FlavorTextEntries({this.flavorText});

  @override
  String toString() {
    return 'FlavorTextEntries{flavorText: $flavorText}';
  }

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    return data;
  }
}