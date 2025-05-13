import 'package:dio/dio.dart';
import 'package:e_commerce/network/base_url.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NetworkApiService {
  late final Dio _dio;

  NetworkApiService() {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
  }

  Future<Response<dynamic>?> post(String path, Object data) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        // if (e.response!.data != null) {
        //   Fluttertoast.showToast(msg: e.message.toString());
        //   print(e.message.toString());
        // } else {
        //   Fluttertoast.showToast(msg: e.message.toString());
        //   print(e.message.toString());
        // }

        if (e.response!.statusCode == 401) {
          Fluttertoast.showToast(msg: "User not found");
        } else {
          Fluttertoast.showToast(msg: e.message.toString());
        }

        return e.response!;
      }
      return null;
    }
  }

  Future<Response<dynamic>?> get(String path) async {
    try {
      final response = await _dio.get(path,
          options: Options(
            headers: {"Content-Type": "application/json"},
          ));
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.data != null) {
          Fluttertoast.showToast(msg: e.toString());
          print(e.message.toString());
        } else {
          Fluttertoast.showToast(msg: e.message.toString());
          print(e.message.toString());
        }
        return e.response!;
      }
      return null;
    }
  }
}
