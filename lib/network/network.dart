import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

const bool PRINT_LOG = false;

enum HttpMethod { GET, POST, PUT, PATCH, DELETE }

class NetworkService {
  Dio _dio;

  BaseOptions _baseOptions = new BaseOptions(
    baseUrl: "http://192.168.0.117:45455/",
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json',
  );

  /// ==========================================================
  /// Singleton Factory
  ///
  ///
  static final NetworkService _network = NetworkService._internal();

  factory NetworkService() {
    _network.init();
    return _network;
  }

  NetworkService._internal();

  /// ==========================================================
  /// One-time initialization
  ///
  ///
  init() {
    if (_dio == null) {
      _dio = Dio(this._baseOptions);
    }
    return null;
  }

  /// ==========================================================
  /// Requests
  ///
  Future<dynamic> request(HttpMethod method, String endpoint,
      {Map headers, body, bool autoLoading = true}) async {
    Response responseNewDTO;
    try {
      if (method == HttpMethod.GET) {
        responseNewDTO = await this._get(endpoint, headers: headers);
      } else if (method == HttpMethod.POST) {
        responseNewDTO =
            await this._post(endpoint, body: body, headers: headers);
      } else if (method == HttpMethod.PUT) {
        responseNewDTO =
            await this._put(endpoint, body: body, headers: headers);
      } else if (method == HttpMethod.PATCH) {
        print('HttpMethod PATCH não implementado!');
      } else if (method == HttpMethod.DELETE) {
        responseNewDTO =
            await this._delete(endpoint, body: body, headers: headers);
      } else {
        print('HttpMethod desconhecido!');
      }
    } catch (e) {
      return responseNewDTO;
    }
    return responseNewDTO;
  }
 ///// METHODS
 Future<dynamic> _get(String endpoint,  {Map headers}) async {
    
    Response response = await _dio.get(
      endpoint,
      options: await _getCustomConfig(headers),
    );

    return response;
  }



  Future<dynamic> _post(String endpoint, {Map headers, body}) async {
 
    Response response = await _dio.post(
      endpoint,
      data: body,
      options: _getCustomConfig(headers),
    );

    return response;
  }

  Future<dynamic> _put(String endpoint, {Map headers, body}) async {
    

    Response response = await _dio.put(
      endpoint,
      data: body,
    );
    return response;
  }

  Future<dynamic> _delete(String endpoint, {Map headers, body}) async {
  

    Response response = await _dio.delete(
      endpoint,
      data: body,
      // ignore: await_only_futures
      options: await this._getCustomConfig(headers),
    );
    return response;
  }

  Options _getCustomConfig(Map<String, String> customHeader) {
    Options options = Options();
    options.headers = this._getDefaultHeader(customHeader);
    return options;
  }

  Map<String, dynamic> _getDefaultHeader(Map<String, String> customHeader) {
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
    };

    return header;
  }

  /// ==========================================================
  /// Extras
  ///

}
