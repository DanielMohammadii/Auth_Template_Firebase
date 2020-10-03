import 'package:auth_tempalate/models/CustomUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User Object base on FireBase user
  CustomUser _changeUsertoCustomUsr(User user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //Stream
  Stream<CustomUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _changeUsertoCustomUsr(user));
  }

  //SignIn Anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _changeUsertoCustomUsr(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Signup With Email and Password
  Future signUpWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _changeUsertoCustomUsr(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Signin With Email and Password
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      return _changeUsertoCustomUsr(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
