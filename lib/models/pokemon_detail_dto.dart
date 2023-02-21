class PokemonDetail {
  Sprites? sprites;
  int? id;
  String? name;
  List<Types>? types;
  Species? species;

  PokemonDetail(this.sprites, this.id, this.types, this.name, this.species);

  PokemonDetail.fromJson(Map<dynamic, dynamic> json) {
    sprites = json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    id = json['id'];
    name = json['name'];
    species = json['species'] != null ? new Species.fromJson(json['species']) : null;
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sprites'] = this.sprites;
    data['id'] = this.id;
    data['name'] = this.name;
    data['species'] = this.species;
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonDetail{id: $id, types: $types, sprites: $sprites, name: $name, species: $species}';
  }
}

class Sprites {
  String? front_default;

  Sprites(this.front_default);

  @override
  String toString() {
    return 'Sprites{front_default: $front_default}';
  }

  Sprites.fromJson(Map<dynamic, dynamic> json) {
    front_default = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.front_default;

    return data;
  }

}

class Types {
  int? slot;

  @override
  String toString() {
    return 'Types{slot: $slot, type: $type}';
  }

  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'Ability{name: $name, url: $url}';
  }
}

class Species {
  String? name;

  @override
  String toString() {
    return 'Species{name: $name, url: $url}';
  }

  String? url;

  Species({this.name, this.url});

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}