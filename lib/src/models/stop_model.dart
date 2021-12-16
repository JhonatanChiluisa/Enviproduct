// To parse this JSON data, do
//
//     final paradas = paradasFromJson(jsonString);

import 'dart:convert';

Paradas paradasFromJson(String str) => Paradas.fromJson(json.decode(str));

String paradasToJson(Paradas data) => json.encode(data.toJson());

class Paradas {
    Paradas({
        this.code,
        this.description,
        this.url,
        this.parentStationId,
        this.stationId,
        this.locationType,
        this.stopId,
        this.name,
    });

    String? code;
    String? description;
    String? url;
    dynamic parentStationId;
    dynamic stationId;
    String? locationType;
    String? stopId;
    String? name;

    factory Paradas.fromJson(Map<String, dynamic> json) => Paradas(
        code: json["code"],
        description: json["description"],
        url: json["url"],
        parentStationId: json["parent_station_id"],
        stationId: json["station_id"],
        locationType: json["location_type"],
        stopId: json["stop_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
        "url": url,
        "parent_station_id": parentStationId,
        "station_id": stationId,
        "location_type": locationType,
        "stop_id": stopId,
        "name": name,
    };
}
