import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel {
  UserModel({
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final String email;
}
