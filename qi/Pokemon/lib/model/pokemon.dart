class Pokemon {
  String? name;

// construtor
  Pokemon(this.name);

// mapeando o json da api
  Pokemon.fromJson(Map<dynamic, dynamic> map) {
    this.name = map['name'] ?? ' ';
  }

  String toString() {
    return '\nNome: $name';
  }
}
