import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/app/models/todo_model.dart';
import 'package:todo_flutter/app/modules/home/home_store.dart';
import 'package:todo_flutter/app/modules/list_todo/listTodo_store.dart';
import 'package:todo_flutter/app/services/todo_service.dart';

class ListTodoPage extends StatefulWidget {
  final String title;
  const ListTodoPage({Key? key, this.title = 'ListTodoPage'}) : super(key: key);
  @override
  ListTodoPageState createState() => ListTodoPageState();
}

class ListTodoPageState extends State<ListTodoPage> {
  final ListTodoStore store = Modular.get();
  final HomeStore homeStore = Modular.get();
  List<TodoModel> todos = [];

  void getTodos() async {
    store.setLoading(true);

    if (homeStore.state.user == null) {
      Navigator.pushReplacementNamed(context, '/');
      return;
    }

    var a = (await TodoService().getTodos()).toList();
    setState(() {
      todos = a;
    });

    store.setLoading(false);
  }

  @override
  void initState() {
    var teste = 10;
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat("dd/MM/yyyy");
    return ScopedBuilder(
      store: store,
      onState: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
                child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        title: Text(todos[index].title!),
                        trailing: Text(
                            format.format(DateTime.parse(todos[index].date!))),
                      ),
                    ),
                  );
                },
              ),
            )));
      },
    );
  }
}
