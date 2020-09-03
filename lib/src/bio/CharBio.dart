class CharBio {
  final int id;
  final String name;
  final String height;
  final String mass;
  final String hair_color;
  final String skin_color;
  final String eye_color;
  final String birth_year;
  final String gender;
  final String pic;
  /*final String homeworld;
  List films;
  List species;
  List starships;*/

  CharBio.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        height = json['height'],
        mass = json['mass'],
        hair_color = json['hair_color'],
        skin_color = json['skin_color'],
        eye_color = json['eye_color'],
        birth_year = json['birth_year'],
        gender = json['gender'],
        pic = json['pic'];
        /*homeworld = json['homeworld'];
        films = json['films'],
        species = json['species'],
        starships = json['starships'];*/

         // object -> json
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'height': height, 'mass': mass, 'hair_color': hair_color,
        'skin_color': skin_color, 'eye_color': eye_color, 'birth_year': birth_year, 'gender': gender, 'pic': pic
        /*'homeworld': homeworld 'films': films, 'species': species, 'starships': starships*/
      };

  @override
  String toString() {
    return 'CharBio{name: $name, height: $height, mass: $mass, hair_color: $hair_color, skin_color: $skin_color, eye_color: $eye_color, birth_year: $birth_year, gender: $gender}';
  }

}