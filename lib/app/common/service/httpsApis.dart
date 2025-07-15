import 'package:dio/dio.dart';

class HttpsApis {
  final dio = Dio();
  String baseUrl = "https://p.flutterschool.cn/";

  HttpsApis() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);
  }

  get(String apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      print("请求失败");
      return null;
    }
  }

  post(String apiUrl, {Map? data}) async {
    try {
      var response = await dio.post(apiUrl, data: data);
      return response;
    } catch (e) {
      print("请求失败");
      return null;
    }
  }
}
