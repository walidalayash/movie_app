import 'dart:io';

abstract class HttpService {
  /// Send GET request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  Future<dynamic> getHttp(String route, Map<String, dynamic>? parameters);

  Future<dynamic> postHttpFormFile(
    String route,
    Map<String, dynamic> body,
    List<File> files,
  );

  /// Send POST request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<dynamic> postHttp(String route, dynamic body);

  /// Send PATCH request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if patch request fails
  Future<dynamic> patchHttp(String route, dynamic body);

  /// Send POST request with [files] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if posting form fails
  Future<dynamic> postHttpForm(
    String route,
    Map<String, dynamic> body,
    List<File> files,
  );

  /// Download file from [fileUrl] and return the File
  ///
  /// - throws `NetworkException` if file download fails
  Future<File> downloadFile(String fileUrl);

  void dispose();
}
