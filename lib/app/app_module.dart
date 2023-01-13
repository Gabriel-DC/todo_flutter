import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_flutter/app/modules/home/home_store.dart';
import 'package:todo_flutter/app/modules/list_todo/listTodo_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute("/list", module: ListTodoModule()),
  ];
}
