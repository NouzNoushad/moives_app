import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:movies_app/data/models/trending_details.dart';
import 'package:movies_app/data/models/trending_movies.dart';
import 'package:movies_app/data/models/trending_tv_series.dart';
import 'package:movies_app/utils/end_points.dart';

import '../../utils/constant.dart';

class MoviesRepository {
  Client baseClient = Client();
  Map<String, String> headers = {
    'Authorization': 'Bearer ${dotenv.get('BEARER_TOKEN')}',
    'Content-Type': 'application/json',
  };

  Future<List<dynamic>> fetchMovies(
      {String type = allType,
      String date = weekly,
      MediaType mediaType = MediaType.all}) async {
    List<dynamic> trending;
    Uri url = Uri.parse(EndPoints.trendingEndPoint(type, date));

    var response = await get(url, headers: headers);

    if (response.statusCode == 200) {
      if (mediaType == MediaType.movie) {
        TrendingResponse trendingResponse =
            trendingResponseFromJson(response.body);
        trending = trendingResponse.results;
        print('//////////////////// movie response: $trending');
      } else if (mediaType == MediaType.tvSeries) {
        TrendingTvSeriesResponse trendingTvSeriesResponse =
            trendingTvSeriesResponseFromJson(response.body);
        trending = trendingTvSeriesResponse.results;
        print('//////////////////// tv response: $trending');
      } else {
        throw Exception('Unable to fetch data');
      }
    } else {
      throw Exception('Unable to fetch data');
    }
    return trending;
  }

  Future<DetailsResponse> getMoviesDetails(String type, int movieId) async {
    DetailsResponse details;
    Uri url = Uri.parse(EndPoints.detailsEndPoint(type, movieId));
    var response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      print('/////////////////////// details: ${response.body}');
      var detailsResponse = detailsResponseFromJson(response.body);
      
      details = detailsResponse;
    } else {
      throw Exception('Unable to fetch data');
    }
    return details;
  }
}
