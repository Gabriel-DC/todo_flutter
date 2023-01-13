import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_flutter/app/modules/home/home_store.dart';

class HttpClient {
  Options defaultOptions = Options(headers: {"Authorization": "Bearer "});
  HomeStore store = Modular.get();

  setOptions(Options? options) async {
    options ??= Options();
    options.headers ??= <String, dynamic>{};
    options.headers?.addAll({
      "Authorization": "Bearer ${await store.state.user!.user!.getIdToken()}"
    });
    return options;
  }

  Future<Response<dynamic>> get(Uri uri, {Options? options}) async {
    options = await setOptions(options);

    return await Dio().get(uri.toString(), options: options);
  }

  Future<dynamic> post(Uri uri, String data, {Options? options}) {
    options = setOptions(options);

    return Dio().post(uri.toString(), data: data, options: options);
  }

  Future<dynamic> put(Uri uri, String data, {Options? options}) {
    options = setOptions(options);

    return Dio().put(uri.toString(), data: data, options: options);
  }

  Future<dynamic> delete(Uri uri, String data, {Options? options}) {
    options = setOptions(options);

    return Dio().delete(uri.toString(), data: data, options: options);
  }
}
