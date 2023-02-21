class Pokemon {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  Pokemon({this.count, this.next, this.previous, this.results});

  Pokemon.fromJson(Map<dynamic, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Pokemon{count: $count, next: $next, previous: $previous, results: $results}';
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  @override
  String toString() {
    return 'Results{name: $name, url: $url,}';
  }

  Results.fromJson(Map<String, dynamic> json) {
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