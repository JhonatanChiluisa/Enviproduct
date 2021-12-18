// To parse this JSON data, do
//
//     final entrega = entregaFromJson(jsonString);

import 'dart:convert';

Entrega entregaFromJson(String str) => Entrega.fromJson(json.decode(str));

String entregaToJson(Entrega data) => json.encode(data.toJson());

class Entrega {
    Entrega({
        this.nombre,
        this.producto,
        this.cantidad,
        this.fechaEntrega,
        this.precio,
        this.lugarDestino,
    });

    String? nombre;
    String? producto;
    int? cantidad;
    String? fechaEntrega;
    double? precio;
    String? lugarDestino;

    factory Entrega.fromJson(Map<String, dynamic> json) => Entrega(
        nombre: json["nombre"],
        producto: json["producto"],
        cantidad: json["cantidad"],
        fechaEntrega: json["fecha_entrega"],
        precio: json["precio"].toDouble(),
        lugarDestino: json["lugar_destino"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "producto": producto,
        "cantidad": cantidad,
        "fecha_entrega": fechaEntrega,
        "precio": precio,
        "lugar_destino": lugarDestino,
    };
}
