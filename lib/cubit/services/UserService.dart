import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:splashscreen/cubit/models/UserModel.dart';

class UserService {
  CollectionReference _userRefference =
      FirebaseFirestore.instance.collection('user');

  Future<void> setUser(UserModel user) async {
    try {
      _userRefference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userRefference.doc(id).get();
      return UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          hobby: snapshot['hobby'],
          balance: snapshot['balance']);
    } catch (e) {
      throw e;
    }
  }
}
