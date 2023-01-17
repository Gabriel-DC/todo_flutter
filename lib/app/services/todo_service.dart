import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_flutter/app/models/todo_model.dart';
import 'package:todo_flutter/app/modules/home/home_store.dart';

import '../../enviroment.dart';
import '../config/http.dart';

class TodoService {
  HttpClient httpClient = HttpClient();
  HomeStore homeStore = Modular.get();

  Future<Iterable<TodoModel>> getTodos() async {
    List<Map<String, dynamic>> response = List<Map<String, dynamic>>.from(
      (await httpClient.get(Uri.https(Environment.apiUrlLocal, "v1/todo")))
          .data,
    );

    return response.map<TodoModel>((e) => TodoModel(
          date: e['date'],
          done: e['done'],
          id: e['id'],
          title: e['title'],
        ));
  }
}
