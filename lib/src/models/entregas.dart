// To parse this JSON data, do
//
//     final entrega = entregaFromJson(jsonString);

import 'dart:convert';

Entrega entregaFromJson(String str) => Entrega.fromJson(json.decode(str));

String entregaToJson(Entrega data) => json.encode(data.toJson());

class Entrega {
  Entrega(
      {this.nombre,
      this.producto,
      this.cantidad,
      this.fechaEntrega,
      this.precio,
      this.lugarDestino,
      this.lat,
      this.lng});

  String? nombre;
  String? producto;
  int? cantidad;
  String? fechaEntrega;
  double? precio;
  String? lugarDestino;
  double? lat;
  double? lng;

  factory Entrega.fromJson(Map<String, dynamic> json) => Entrega(
      nombre: json["nombre"],
      producto: json["producto"],
      cantidad: json["cantidad"],
      fechaEntrega: json["fechaentrega"],
      precio: json["precio"].toDouble(),
      lugarDestino: json["luegardestino"],
      lat: json["lat"],
      lng: json["lng"]);

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "producto": producto,
        "cantidad": cantidad,
        "fechaentrega": fechaEntrega,
        "precio": precio,
        "luegardestino": lugarDestino,
        "lat": lat,
        "lng": lng
      };
}
