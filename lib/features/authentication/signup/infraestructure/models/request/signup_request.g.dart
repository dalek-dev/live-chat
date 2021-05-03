// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) {
  return SignUpRequest(
    name: json['nombre'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    age: json['edad'] as int,
  );
}

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'nombre': instance.name,
      'password': instance.password,
      'email': instance.email,
      'edad': instance.age,
    };
