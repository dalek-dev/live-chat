
import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    this.ok,
    this.usuario,
    this.token,
  });

  bool? ok;
  Usuario? usuario;
  String? token;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    ok: json["ok"],
    usuario: Usuario.fromJson(json["usuario"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "usuario": usuario?.toJson(),
    "token": token,
  };
}

class Usuario {
  Usuario({
    this.online,
    this.nombre,
    this.email,
    this.uid,
  });

  bool? online;
  String? nombre;
  String? email;
  String? uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    online: json["online"],
    nombre: json["nombre"],
    email: json["email"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "online": online,
    "nombre": nombre,
    "email": email,
    "uid": uid,
  };
}
