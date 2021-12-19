// To parse this JSON data, do
//
//     final entregas = entregasFromJson(jsonString);

import 'dart:convert';

List<Entregas> entregasFromJson(String str) => List<Entregas>.from(json.decode(str).map((x) => Entregas.fromJson(x)));

String entregasToJson(List<Entregas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Entregas {
    Entregas({
        this.fieldsProto,
    });

    FieldsProto? fieldsProto;

    factory Entregas.fromJson(Map<String, dynamic> json) => Entregas(
        fieldsProto: FieldsProto.fromJson(json["_fieldsProto"]),
    );

    Map<String, dynamic> toJson() => {
        "_fieldsProto": fieldsProto!.toJson(),
    };
}

class FieldsProto {
    FieldsProto({
        this.luegardestino,
        this.precio,
        this.cantidad,
        this.fechaentrega,
        this.nombre,
        this.producto,
    });

    Fechaentrega? luegardestino;
    Cantidad? precio;
    Cantidad? cantidad;
    Fechaentrega? fechaentrega;
    Fechaentrega? nombre;
    Fechaentrega? producto;

    factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        luegardestino: Fechaentrega.fromJson(json["luegardestino"]),
        precio: Cantidad.fromJson(json["precio"]),
        cantidad: Cantidad.fromJson(json["cantidad"]),
        fechaentrega: Fechaentrega.fromJson(json["fechaentrega"]),
        nombre: Fechaentrega.fromJson(json["nombre"]),
        producto: Fechaentrega.fromJson(json["producto"]),
    );

    Map<String, dynamic> toJson() => {
        "luegardestino": luegardestino!.toJson(),
        "precio": precio!.toJson(),
        "cantidad": cantidad!.toJson(),
        "fechaentrega": fechaentrega!.toJson(),
        "nombre": nombre!.toJson(),
        "producto": producto!.toJson(),
    };
}

class Cantidad {
    Cantidad({
        this.integerValue,
        this.valueType,
    });

    String? integerValue;
    String? valueType;

    factory Cantidad.fromJson(Map<String, dynamic> json) => Cantidad(
        integerValue: json["integerValue"],
        valueType: json["valueType"],
    );

    Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
        "valueType": valueType,
    };
}

class Fechaentrega {
    Fechaentrega({
        this.stringValue,
        this.valueType,
    });

    String? stringValue;
    String? valueType;

    factory Fechaentrega.fromJson(Map<String, dynamic> json) => Fechaentrega(
        stringValue: json["stringValue"],
        valueType: json["valueType"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
        "valueType": valueType,
    };
}
