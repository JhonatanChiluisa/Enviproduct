// To parse this JSON data, do
//
//     final proveedor = proveedorFromJson(jsonString);

import 'dart:convert';

Proveedor proveedorFromJson(String str) => Proveedor.fromJson(json.decode(str));

String proveedorToJson(Proveedor data) => json.encode(data.toJson());

class Proveedor {
    Proveedor({
        this.nombre,
        this.localizacion,
        this.calificacion,
    });

    String? nombre;
    String? localizacion;
    String? calificacion;

    factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
        nombre: json["nombre"],
        localizacion: json["localizacion"],
        calificacion: json["calificacion"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "localizacion": localizacion,
        "calificacion": calificacion,
    };
}
