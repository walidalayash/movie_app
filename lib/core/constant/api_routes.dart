/// List of api end points
class ApiRoutes {
  ApiRoutes._();

  static String base_url = 'https://smdb.sadeem-lab.com/';
  static String v1 = 'api/v1';
  static String base = base_url + v1;
  static String users = 'http://localhost:8022';

  static String movies = '$base/movies';
  static String actors = '$base/actors';
  static String genres = '$base/genres';
  static String favorites = '$base/favorite';

  static String actor(String? id) => '$base/actor/$id';
  static String genre(String? id) => '$base/genres/$id';
  static String movie(String? id) => '$base/movies/$id';
  static String favorite(String? id) => '$base/favorite/$id';

  //
  // static String related_movie(String? id) =>
  //    '$base/movies?filters=related_movies:eq:$id';
  static String related_movie(String? id) =>
      'https://smdb.sadeem-lab.com/api/v1/movies/$id';
  static String token_user = 'https://smdb.sadeem-lab.com/api/v1/web-login';
  static String user_info = 'https://smdb.sadeem-lab.com/api/v1/me';
}
