
import 'dart:convert';

UsersResponse usersResponseFromJson(String str) => UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
  UsersResponse({
    this.ok,
    this.usuarios,
  });

  bool? ok;
  List<Usuario>? usuarios;

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
    ok: json["ok"],
    usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "usuarios": List<dynamic>.from(usuarios!.map((x) => x.toJson())),
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
