// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.nombres,
        this.apellidos,
        this.correo,
        this.contrasea,
    });

    String? nombres;
    String? apellidos;
    String? correo;
    String? contrasea;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        correo: json["correo"],
        contrasea: json["contraseña"],
    );

    Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidos": apellidos,
        "correo": correo,
        "contraseña": contrasea,
    };
}
