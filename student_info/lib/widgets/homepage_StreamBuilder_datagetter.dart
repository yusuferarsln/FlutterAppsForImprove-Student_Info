import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_info/models/parent_model.dart';

class homepage_StreamBuilder extends StatelessWidget {
  const homepage_StreamBuilder({
    Key? key,
    required this.parentRef,
    required this.data,
  }) : super(key: key);

  final DocumentReference<Object?> parentRef;
  final List<Welcome> data;

  @override
  Widget build(BuildContext context) {
    Color palletOrange = Color.fromRGBO(238, 238, 238, 1);
    Color palletYellow = Color.fromRGBO(57, 62, 70, 0.8);
    Color palletPurple = Color.fromRGBO(0, 173, 181, 1);
    return StreamBuilder(
        stream: parentRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
          data.add(Welcome.fromJson(asyncsnapshot.data.data()));
          String childPhoto = data[0].childPhotoUrl;
          String childName = data[0].userChild;
          String parentName = data[0].userName;
          return Card(
            color: palletOrange,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                CircleAvatar(
                  backgroundColor: palletPurple,
                  backgroundImage: NetworkImage(childPhoto),
                  radius: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Student : $childName ',
                    style: TextStyle(fontSize: 30, color: palletPurple),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        });
  }
}
