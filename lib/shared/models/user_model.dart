import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  final double score;

  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
