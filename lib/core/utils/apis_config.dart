class ApisConfig {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "a1f18955374c022f6404ba14b7acd019";

  //!apis fro movies
  static const nowPlayingMovieUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
      //? https://api.themoviedb.org/3/movie/popular?api_key=a1f18955374c022f6404ba14b7acd019
  static const popularMovieUrl = "$baseUrl/movie/popular?api_key=$apiKey";
  static const topRatedMovieUrl = "$baseUrl/movie/top_rated?api_key=$apiKey";

//! movie details
//? https://api.themoviedb.org/3/movie/653346?api_key=a1f18955374c022f6404ba14b7acd019
  static String movieDetailsUrl(movieID) =>
      "$baseUrl/movie/$movieID?api_key=$apiKey";
//? https://api.themoviedb.org/3/movie/653346/recommendations?api_key=a1f18955374c022f6404ba14b7acd019
    static String recommendationUrl(movieID) =>
      "$baseUrl/movie/$movieID/recommendations?api_key=$apiKey";

  //! images
//? https://images.tmdb.org/t/p/w500/fqv8v6AycXKsivp1T5yKtLbGXce.jpg
  static const baseImageUrl = 'https://images.tmdb.org/t/p/w500';
  static imageUrl(String path) => "$baseImageUrl$path";
//?
  //! apis for TV
}
