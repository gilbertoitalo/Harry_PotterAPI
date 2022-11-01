// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Personagem {
  String? name;
  List<String>? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool? wizard;
  String? ancestry;
  String? eyeColour;
  String? hairColour;
  Wand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List<String>? alternateActors;
  bool? alive;
  String? image;

  Personagem(
      this.name,
      this.alternateNames,
      this.species,
      this.gender,
      this.house,
      this.dateOfBirth,
      this.yearOfBirth,
      this.wizard,
      this.ancestry,
      this.eyeColour,
      this.hairColour,
      this.wand,
      this.patronus,
      this.hogwartsStudent,
      this.hogwartsStaff,
      this.actor,
      this.alternateActors,
      this.alive,
      this.image);

  factory Personagem.fromMap(Map<String, dynamic> map) {
    return Personagem(
      map['name'] != null ? map['name'] as String : null,
      map['alternateNames'] != null
          ? List<String>.from(map['alternateNames'] as List<String>)
          : null,
      map['species'] != null ? map['species'] as String : null,
      map['gender'] != null ? map['gender'] as String : null,
      map['house'] != null ? map['house'] as String : null,
      map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      map['yearOfBirth'] != null ? map['yearOfBirth'] as int : null,
      map['wizard'] != null ? map['wizard'] as bool : null,
      map['ancestry'] != null ? map['ancestry'] as String : null,
      map['eyeColour'] != null ? map['eyeColour'] as String : null,
      map['hairColour'] != null ? map['hairColour'] as String : null,
      map['wand'] != null
          ? Wand.fromMap(map['wand'] as Map<String, dynamic>)
          : null,
      map['patronus'] != null ? map['patronus'] as String : null,
      map['hogwartsStudent'] != null ? map['hogwartsStudent'] as bool : null,
      map['hogwartsStaff'] != null ? map['hogwartsStaff'] as bool : null,
      map['actor'] != null ? map['actor'] as String : null,
      map['alternateActors'] != null
          ? List<String>.from(map['alternateActors'] as List<String>)
          : null,
      map['alive'] != null ? map['alive'] as bool : null,
      map['image'] != null ? map['image'] as String : null,
    );
  }

  factory Personagem.fromJson(String source) =>
      Personagem.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wand {
  String? wood;
  String? core;
  String? length;

  Wand({this.wood, this.core, this.length});

  factory Wand.fromMap(Map<String, dynamic> map) {
    return Wand(
      wood: map['wood'] != null ? map['wood'] as String : null,
      core: map['core'] != null ? map['core'] as String : null,
      length: map['length'] != null ? map['length']!.toString() : null,
    );
  }
}
