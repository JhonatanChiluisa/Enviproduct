// To parse this JSON data, do
//
//     final perfil = perfilFromJson(jsonString);

import 'dart:convert';
Perfil perfilFromJson(String str) => Perfil.fromJson(json.decode(str));
String perfilToJson(Perfil data) => json.encode(data.toJson());

class Perfil {
    Perfil({
        this.idperfil,
        this.cedula,
        this.nombre,
        this.edad,
        this.tipolicencia,
        this.cooperativa,
        this.celular,
        this.direccion,
    });

    String? idperfil;
    String? cedula;
    String? nombre;
    String? edad;
    String? tipolicencia;
    String? cooperativa;
    String? celular;
    String? direccion;

    factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
        idperfil: json["idperfil"],
        cedula: json["cedula"],
        nombre: json["nombre"],
        edad: json["edad"],
        tipolicencia: json["tipolicencia"],
        cooperativa: json["cooperativa"],
        celular: json["celular"],
        direccion: json["direccion"],
    );

    Map<String, dynamic> toJson() => {
        "idperfil": idperfil,
        "cedula": cedula,
        "nombre": nombre,
        "edad": edad,
        "tipolicencia": tipolicencia,
        "cooperativa": cooperativa,
        "celular": celular,
        "direccion": direccion,
    };
}
