// import 'package:binna/Cache/chaching.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          // baseUrl: "https://172.16.90.112:3000/",
          receiveDataWhenStatusError: true,
          headers: {"Content-Type": "application/json"}),
    );
  }

  static Future<Response> adddata({
    required String URL,
    required Map<String, dynamic> data,
    String lang = "",
  }) async {
    dio.options.headers = {
      "lang": lang,
      // "Authorization": Cache.getdata(key: "token") ?? "",
    };
    return await dio.post(URL, data: data);
  }

  static Future<Response> getdata({
    required String URL,
    required Map<String, dynamic> data,
    String lang = "",
  }) async {
    dio.options.headers = {
      "lang": "en",
      // "Authorization": Cache.getdata(key: "token") ?? "",
      // "secret-key": "4YEpX/WfI85odrI7hVAZGllq+0sM+c/NeVAVUTM4wIKjh+I8iU+U",
    };
    return await dio.get(URL, data: data);
  }

  static Future<Response> postdata({
    required String URL,
    var data,
    // String lang = "",
    // String token = "",
  }) async {
    dio.options.headers = {
      "Language": "English",
      // // "Authorization": Cache.getdata(key: "token") ?? "",
      // "secret-key": "4YEpX/WfI85odrI7hVAZGllq+0sM+c/NeVAVUTM4wIKjh+I8iU+U"
    };

    return await dio.post(URL, data: data);
  }

  static Future<Response> getdataa({
    required String URL,
    required Map<String, dynamic> data,
    String lang = "",
  }) async {
    dio.options.headers = {
      // "Language": Cache.getdata(key: "lang"),
    };
    return await dio.get(URL, data: data);
  }

  static Future<Response> getdataaa({
    required String URL,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(URL, queryParameters: query);
  }
}
