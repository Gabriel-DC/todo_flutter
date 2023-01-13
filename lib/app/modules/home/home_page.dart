import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_flutter/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late UserCredential user;
  HomeStore store = Modular.get();

  Future<void> login() async {
    var provider = GoogleAuthProvider();
    user = await FirebaseAuth.instance.signInWithPopup(provider);

    store.updateStore(MyUser(user: user));

    Navigator.pushReplacementNamed(context, "/list");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.purple[800],
          ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 12,
          child: TextButton(
            onPressed: login,
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
