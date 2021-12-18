// To parse this JSON data, do
//
//     final actividades = actividadesFromJson(jsonString);

import 'dart:convert';

Actividades actividadesFromJson(String str) => Actividades.fromJson(json.decode(str));

String actividadesToJson(Actividades data) => json.encode(data.toJson());

class Actividades {
    Actividades({
        this.titulo,
        this.localizacion,
        this.tiempoInical,
        this.tiempoFinal,
    });

    String? titulo;
    String? localizacion;
    String? tiempoInical;
    String? tiempoFinal;

    factory Actividades.fromJson(Map<String, dynamic> json) => Actividades(
        titulo: json["titulo"],
        localizacion: json["localizacion"],
        tiempoInical: json["tiempo_inical"],
        tiempoFinal: json["tiempo_final"],
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "localizacion": localizacion,
        "tiempo_inical": tiempoInical,
        "tiempo_final": tiempoFinal,
    };

}
