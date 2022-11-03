import 'dart:convert';

import 'package:collection/collection.dart';

class BreakinBadDataModel {
  final int? charId;
  final String? name;
  final String? birthday;
  final List<dynamic>? occupation;
  final String? img;
  final String? status;
  final String? nickname;
  final List<dynamic>? appearance;
  final String? portrayed;
  final String? category;
  final List<dynamic>? better_Call_Saul_Appearance;

  const BreakinBadDataModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.better_Call_Saul_Appearance,
  });

  @override
  String toString() {
    return 'BreakinBadDataModel(charId: $charId, name: $name, birthday: $birthday, occupation: $occupation, img: $img, status: $status, nickname: $nickname, appearance: $appearance, portrayed: $portrayed, category: $category, betterCallSaulAppearance: $better_Call_Saul_Appearance)';
  }

  factory BreakinBadDataModel.fromMap(Map<String, dynamic> data) {
    return BreakinBadDataModel(
      charId: data['char_id'] as int?,
      name: data['name'] as String?,
      birthday: data['birthday'] as String?,
      occupation: data['occupation'] as List<dynamic>?,
      img: data['img'] as String?,
      status: data['status'] as String?,
      nickname: data['nickname'] as String?,
      appearance: data['appearance'] as List<dynamic>?,
      portrayed: data['portrayed'] as String?,
      category: data['category'] as String?,
      better_Call_Saul_Appearance:
          data['better_call_saul_appearance'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'char_id': charId,
        'name': name,
        'birthday': birthday,
        'occupation': occupation,
        'img': img,
        'status': status,
        'nickname': nickname,
        'appearance': appearance,
        'portrayed': portrayed,
        'category': category,
        'better_call_saul_appearance': better_Call_Saul_Appearance,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BreakinBadDataModel].
  factory BreakinBadDataModel.fromJson(String data) {
    return BreakinBadDataModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BreakinBadDataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  BreakinBadDataModel copyWith({
    int? charId,
    String? name,
    String? birthday,
    List<String>? occupation,
    String? img,
    String? status,
    String? nickname,
    List<int>? appearance,
    String? portrayed,
    String? category,
    List<dynamic>? betterCallSaulAppearance,
  }) {
    return BreakinBadDataModel(
      charId: charId ?? this.charId,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      occupation: occupation ?? this.occupation,
      img: img ?? this.img,
      status: status ?? this.status,
      nickname: nickname ?? this.nickname,
      appearance: appearance ?? this.appearance,
      portrayed: portrayed ?? this.portrayed,
      category: category ?? this.category,
      better_Call_Saul_Appearance:
          betterCallSaulAppearance ?? this.better_Call_Saul_Appearance,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BreakinBadDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      charId.hashCode ^
      name.hashCode ^
      birthday.hashCode ^
      occupation.hashCode ^
      img.hashCode ^
      status.hashCode ^
      nickname.hashCode ^
      appearance.hashCode ^
      portrayed.hashCode ^
      category.hashCode ^
      better_Call_Saul_Appearance.hashCode;
}
