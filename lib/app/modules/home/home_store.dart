import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, MyUser> {
  HomeStore() : super(MyUser());

  Future<void> updateStore(MyUser user) async {
    update(user);
  }
}

class MyUser {
  MyUser({this.user});
  UserCredential? user;
}
