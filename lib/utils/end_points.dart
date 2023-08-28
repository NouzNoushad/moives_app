class EndPoints {
  static const String baseEndpoint = 'https://api.themoviedb.org/3';

  static String trendingEndPoint(String type, String date) {
    return '$baseEndpoint/trending/$type/$date?language=en-US';
  }

  static String detailsEndPoint(String type, int movieId) {
    return '$baseEndpoint/$type/$movieId?language=en-US';
  }

  static String imageEndPoint(String imagePath) {
    return 'https://image.tmdb.org/t/p/original/$imagePath';
  }
}
