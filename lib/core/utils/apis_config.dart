class ApisConfig {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "a1f18955374c022f6404ba14b7acd019";

  //? apis fro movies
  static const nowPlayingMovieUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const popularMovieUrl = "$baseUrl/popular?api_key=$apiKey";
  static const topRatedMovieUrl = "$baseUrl/movie/top_rated?api_key=$apiKey";

  //? apis for TV
}
