// To parse this JSON data, do
//
//     final proveedor = proveedorFromJson(jsonString);

import 'dart:convert';

Proveedor proveedorFromJson(String str) => Proveedor.fromJson(json.decode(str));

String proveedorToJson(Proveedor data) => json.encode(data.toJson());

class Proveedor {
  Proveedor({
    this.id,
    required this.tipo,
    required this.nombre,
    required this.localizacion,
    required this.contacto,
  });

  int? id;
  int tipo;
  String nombre;
  String localizacion;
  String contacto;

  factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
        id: json["id"],
        tipo: json["tipo"] as int,
        nombre: json["nombre"],
        localizacion: json["localizacion"],
        contacto: json["contacto"],
      );
  factory Proveedor.created() => Proveedor(tipo: 0, nombre: "", localizacion: "", contacto: "");
  Map<String, dynamic> toJson() => {
        "id": id, 
        "tipo": tipo,
        "nombre": nombre,
        "localizacion": localizacion,
        "contacto": contacto,
      };
}
