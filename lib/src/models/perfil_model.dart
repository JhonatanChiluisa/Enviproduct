// To parse this JSON data, do
//
//     final perfil = perfilFromJson(jsonString);

import 'dart:convert';

Perfil perfilFromJson(String str) => Perfil.fromJson(json.decode(str));


class Perfil {
    Perfil({
        this.cedula,
        this.nombre,
        this.edad,
        this.tipoLicencia,
        this.cooperativaTrasporte,
        this.celular,
        this.direccion,
        this.foto,
    });

    String? cedula;
    String? nombre;
    String? edad;
    String? tipoLicencia;
    String? cooperativaTrasporte;
    String? celular;
    String? direccion;
    List<String>? foto;

    factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
        cedula: json["cedula"],
        nombre: json["nombre"],
        edad: json["edad"],
        tipoLicencia: json["tipoLicencia"],
        cooperativaTrasporte: json["cooperativaTrasporte"],
        celular: json["celular"],
        direccion: json["direccion"],
        foto: List<String>.from(json["foto"].map((x) => x)),
    );
}

