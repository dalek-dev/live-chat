import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: 'nombre')
  String name;

  String password;

  String email;

  @JsonKey(name: 'edad')
  int age;

  SignUpRequest({
    required this.name,
    required this.email,
     required this.password,
    required this.age
    });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
