import 'package:todo_flutter/app/modules/list_todo/listTodo_Page.dart';
import 'package:todo_flutter/app/modules/list_todo/listTodo_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListTodoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListTodoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ListTodoPage()),
  ];
}
