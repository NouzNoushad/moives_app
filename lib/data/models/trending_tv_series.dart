// To parse this JSON data, do
//
//     final trendingTvSeriesResponse = trendingTvSeriesResponseFromJson(jsonString);

import 'dart:convert';

TrendingTvSeriesResponse trendingTvSeriesResponseFromJson(String str) =>
    TrendingTvSeriesResponse.fromJson(json.decode(str));

String trendingTvSeriesResponseToJson(TrendingTvSeriesResponse data) =>
    json.encode(data.toJson());

class TrendingTvSeriesResponse {
  int page;
  List<TvResult> results;
  int totalPages;
  int totalResults;

  TrendingTvSeriesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingTvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      TrendingTvSeriesResponse(
        page: json["page"],
        results:
            List<TvResult>.from(json["results"].map((x) => TvResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TvResult {
  bool adult;
  String backdropPath;
  int id;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  String mediaType;
  List<int> genreIds;
  double popularity;
  String firstAirDate;
  double voteAverage;
  int voteCount;
  List<String> originCountry;

  TvResult({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });

  factory TvResult.fromJson(Map<String, dynamic> json) => TvResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        originalLanguage:
            json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "name": name,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "first_air_date": firstAirDate,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
      };
}


