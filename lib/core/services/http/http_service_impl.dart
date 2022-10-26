import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:movieapp/core/constant/constants.dart';

import '../../../locator.dart';
import '../../exceptions/invalid_input_exception.dart';
import '../../exceptions/network_exception.dart';
import '../../utils/file_helper.dart';
import '../../utils/network_utils.dart' as network_utils;
import 'http_service.dart';

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl implements HttpService {
  final FileHelper? _fileHelper = locator<FileHelper>();

  final _log = Logger('HttpServiceImpl');
  final _dio = Dio();

  @override
  Future<dynamic> getHttp(
      String route, Map<String, dynamic>? parameters) async {
    Response response;

    parameters ??= {};

    if (Constants.isHttpLogON) {
      _log.fine('Sending GET to $route with $parameters');
    }

    _dio.options.headers['content-Type'] = 'application/json';

    final token = await FlutterSecureStorage().read(key: 'token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';
    }

    if (Constants.isHttpLogON) {
      _log.fine('headers => ${_dio.options.headers}');
    }

    try {
      final fullRoute = '$route';
      response = await _dio.get(
        fullRoute,
        queryParameters: parameters,
      );
    } on DioError catch (e) {
      if (Constants.isHttpLogON) {
        _log.severe('HttpService: Failed to GET ${e.response}');
      }

      network_utils.checkForNetworkExceptions(e.response!);

      throw NetworkException(e.message);
    }

    if (Constants.isHttpLogON) {
      _log.shout(response);
    }

    network_utils.checkForNetworkExceptions(response);

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> postHttp(String route, dynamic body) async {
    Response? response;

    if (Constants.isHttpLogON) {
      debugPrint('Sending POST $body');
      _log.fine('to $route');
    }

    _dio.options.headers['content-Type'] = 'application/json';

    final token = await FlutterSecureStorage().read(key: 'token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';
    }

    try {
      final fullRoute = '$route';
      response = await _dio.post(
        fullRoute,
        data: body,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      if (Constants.isHttpLogON) {
        _log.shout('HttpService: Failed to POST ${e.message}');
        _log.shout('HttpService: response ${e.response}');
      }

      if (body != null && e.response!.statusCode == 400) {
        throw InvalidInputException(e.message);
      }

      network_utils.checkForNetworkExceptions(e.response!);

      throw NetworkException(e.message);
    }

    if (Constants.isHttpLogON) {
      _log.shout(response);
    }

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> patchHttp(String route, dynamic body) async {
    Response response;

    if (Constants.isHttpLogON) {
      _log.fine('Sending PATCH $body to $route');
    }
    _dio.options.headers['content-Type'] = 'application/json';

    final token = await FlutterSecureStorage().read(key: 'token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';
    }

    try {
      final fullRoute = '$route';
      response = await _dio.patch(
        fullRoute,
        data: body,
        queryParameters: body,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      if (e.response!.statusCode !=
          405) // method is not supported for this route
      {
        if (body != null) {}
      }
      if (Constants.isHttpLogON) {
        _log.severe('HttpService: Failed to POST ${e.message}');
      }

      throw NetworkException(e.message);
    }

    network_utils.checkForNetworkExceptions(response);

    return response.data;
  }

  @override
  Future<dynamic> postHttpForm(
    String route,
    Map<String, dynamic> body,
    List<File> files,
  ) async {
    var index = 0;

    final formData = FormData.fromMap(body);
    files.forEach((file) async {
      final mFile = await _fileHelper!.convertFileToMultipartFile(file);
      formData.files.add(MapEntry('img$index', mFile));
      index++;
    });

    final data = await postHttp(route, formData);

    if (Constants.isHttpLogON) {
      _log.shout(data.toString());
    }
    return data;
  }

  @override
  Future<File> downloadFile(String fileUrl) async {
    Response response;

    final file = await _fileHelper!.getFileFromUrl(fileUrl);

    final token = await FlutterSecureStorage().read(key: 'token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';
    }

    try {
      response = await _dio.download(
        fileUrl,
        file.path,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      if (Constants.isHttpLogON) {
        _log.severe('HttpService: Failed to download file ${e.message}');
      }
      throw NetworkException(e.message);
    }

    network_utils.checkForNetworkExceptions(response);

    return file;
  }

  @override
  Future<dynamic> postHttpFormFile(
    String route,
    Map<String, dynamic> body,
    List<File> files,
  ) async {
    _log.fine('files' + files.toString());

    final formData = FormData.fromMap(body);

    for (var file in files) {
      final mFile = await _fileHelper!.convertFileToMultipartFile(file);

      formData.files.add(MapEntry('img', mFile));
    }

    _dio.options.contentType = 'multipart/form-data';

    debugPrint('Sending Post $route');
    log('Sending formData $body');

    final token = await FlutterSecureStorage().read(key: 'token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';
    }

    var response = await _dio.post(route, data: formData);

    _log.shout(response.statusCode);

    return response.data;
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }
}
