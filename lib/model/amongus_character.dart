import 'dart:convert';

class AmongUsCharacter {
 
  String name;
  String image;
  String color;
  String hexColor;
  bool hasHat;

  AmongUsCharacter({
    this.name,
    this.image,
    this.color,
    this.hexColor,
  });


  factory AmongUsCharacter.fromJson(Map<String, dynamic> json) =>
      AmongUsCharacter(
          name: json["name"],
          image: json["image"],
          color: json["color"],
          hexColor: json["hexColor"]
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "color": color,
    "hexColor": hexColor,
    "hasHat": hasHat
  };
}

AmongUsCharacter amongUsCharacterFromJson(String str) =>
    AmongUsCharacter.fromJson(json.decode(str));

String amongUsCharacterToJson(AmongUsCharacter data) =>
    json.encode(data.toJson());