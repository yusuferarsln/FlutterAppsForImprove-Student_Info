import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_info/models/parent_model.dart';
import 'package:student_info/services/auth_services.dart';
import 'package:student_info/widgets/homepage_StreamBuilder_datagetter.dart';
import 'package:student_info/widgets/homepage_StreamBuilder_toList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    List<Welcome> data = [];
    CollectionReference childRef = _firestore
        .collection('Parents')
        .doc('${auth.currentUser!.uid}')
        .collection('${auth.currentUser!.uid}');
    DocumentReference parentRef =
        _firestore.collection('Parents').doc('${auth.currentUser!.uid}');

    var currentParrent = auth.currentUser!.uid;
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/ic_background.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            leading: TextButton(
                onPressed: () {
                  AuthController.instance.logOut();
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    homepage_StreamBuilder(parentRef: parentRef, data: data),
                    homepage_StreamBuilder_toList(childRef: childRef)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
