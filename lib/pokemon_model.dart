
class Pokemon {
  String name;

  Pokemon({

    required this.name,

  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(

      name: json['name'],
      
    );
  }

  factory Pokemon.fromFirebaseJson(Map<String, dynamic> json) {
    return Pokemon(

      name: json['name'],

    );
  }

  Map<String, Object?> toJson() {
    return {

      'name': name,

    };
  }
}
