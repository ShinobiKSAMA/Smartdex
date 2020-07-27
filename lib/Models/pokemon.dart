class Pokemon {
  String image;
  String num;
  String name;
  List<String> type;
  String species;
  String height;
  String weight;
  Stats stats;
  List<String> evolution;

  Pokemon(
      {this.image,
        this.num,
        this.name,
        this.type,
        this.species,
        this.height,
        this.weight,
        this.stats,
        this.evolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    num = json['num'];
    name = json['name'];
    type = json['type'].cast<String>();
    species = json['species'];
    height = json['height'];
    weight = json['weight'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    evolution = json['evolution'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['num'] = this.num;
    data['name'] = this.name;
    data['type'] = this.type;
    data['species'] = this.species;
    data['height'] = this.height;
    data['weight'] = this.weight;
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
    }
    data['evolution'] = this.evolution;
    return data;
  }
}

class Stats {
  String hp;
  String attack;
  String defense;
  String spAttack;
  String spDefense;
  String speed;

  Stats(
      {this.hp,
        this.attack,
        this.defense,
        this.spAttack,
        this.spDefense,
        this.speed});

  Stats.fromJson(Map<String, dynamic> json) {
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    spAttack = json['sp attack'];
    spDefense = json['sp defense'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hp'] = this.hp;
    data['attack'] = this.attack;
    data['defense'] = this.defense;
    data['sp attack'] = this.spAttack;
    data['sp defense'] = this.spDefense;
    data['speed'] = this.speed;
    return data;
  }
}