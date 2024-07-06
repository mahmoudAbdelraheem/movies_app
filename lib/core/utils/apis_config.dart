class ApisConfig {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "a1f18955374c022f6404ba14b7acd019";

  //!apis fro movies
  //? https://api.themoviedb.org/3/movie/now_playing?api_key=a1f18955374c022f6404ba14b7acd019
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
//   static String recommendationUrl(movieID) =>
//       "$baseUrl/movie/$movieID/recommendations?api_key=$apiKey";
// //? https://api.themoviedb.org/3/movie/653346/similar?api_key=a1f18955374c022f6404ba14b7acd019
  static String recommendationUrl(movieID) =>
      "$baseUrl/movie/$movieID/similar?api_key=$apiKey";

  //! images
//? https://images.tmdb.org/t/p/w500/fqv8v6AycXKsivp1T5yKtLbGXce.jpg
  static const baseImageUrl = 'https://images.tmdb.org/t/p/w500';
  static imageUrl(String path) => "$baseImageUrl$path";


  //! search by movie name
//?https://api.themoviedb.org/3/search/movie?query=bad&api_key=a1f18955374c022f6404ba14b7acd019
  static String getMoviesBySearchQueryUrl(String name) =>
      '$baseUrl/search/movie?query=$name&api_key=$apiKey';

  //? https://api.themoviedb.org/3/genre/movie/list?api_key=a1f18955374c022f6404ba14b7acd019
  //? get genres list for movies
  static const String genresUrl = "$baseUrl/genre/movie/list?api_key=$apiKey";

  static String getMoviesByGenreIdUrl(String genreId) =>
      '$baseUrl/discover/movie?api_key=$apiKey&with_genres=$genreId';



}
