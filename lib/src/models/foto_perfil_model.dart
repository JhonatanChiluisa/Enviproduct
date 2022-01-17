import 'dart:convert';

FotoPerfilModel fotoFromJson(String str) =>
    FotoPerfilModel.fromJson(json.decode(str));

String fotoToJson(FotoPerfilModel data) => json.encode(data.toJson());

class FotoPerfilModel {
  FotoPerfilModel({this.url, this.idperfil});

  String? url;
  String? idperfil;

  factory FotoPerfilModel.created(String value) => FotoPerfilModel();

  factory FotoPerfilModel.fromJson(Map<String, dynamic> json) =>
      FotoPerfilModel(
        url: json["url"],
        idperfil: json["idperfil"]
      );

  Map<String, dynamic> toJson() => {
    "url": url,
    "idperfil": idperfil
    };
}
