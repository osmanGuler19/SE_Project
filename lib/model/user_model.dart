import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String password;
  String phone;
  String? address;
  String? avatar;
  String role;
  String? createdAt;
  String? updatedAt;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      this.address,
      this.avatar,
      required this.role,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
