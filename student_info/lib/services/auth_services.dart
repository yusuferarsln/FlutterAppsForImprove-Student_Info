import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:student_info/login_auth/login_page.dart';
import 'package:student_info/pages/home_page_view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(
    User? user,
  ) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  void register(String email, password, name) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore
          .collection("Parents")
          .doc(user.user!.uid)
          .set({'userName': name, 'userMail': email});
      print(user.user!.uid);
    } catch (e) {
      Get.snackbar("About User", "User message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Acount creation failed'),
          messageText: Text(
            e.toString(),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Login failed'),
          messageText: Text(
            e.toString(),
          ));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
