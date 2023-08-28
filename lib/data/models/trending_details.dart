// To parse this JSON data, do
//
//     final detailsResponse = detailsResponseFromJson(jsonString);

import 'dart:convert';

DetailsResponse detailsResponseFromJson(String str) =>
    DetailsResponse.fromJson(json.decode(str));

String detailsResponseToJson(DetailsResponse data) =>
    json.encode(data.toJson());

class DetailsResponse {
  String backdropPath;

  List<Genre> genres;

  int id;
  String overview;
  String posterPath;


  DetailsResponse({
    required this.backdropPath,
    required this.genres,

    required this.id,
    
    required this.overview,
    required this.posterPath,

  });

  factory DetailsResponse.fromJson(Map<String, dynamic> json) =>
      DetailsResponse(
        backdropPath: json["backdrop_path"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
 
        id: json["id"],
    
        overview: json["overview"],
        posterPath: json["poster_path"],
    
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),

        "id": id,
    
        "overview": overview,
        "poster_path": posterPath,
   
      };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
