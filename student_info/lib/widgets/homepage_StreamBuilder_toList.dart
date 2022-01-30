import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class homepage_StreamBuilder_toList extends StatelessWidget {
  const homepage_StreamBuilder_toList({
    Key? key,
    required this.childRef,
  }) : super(key: key);

  final CollectionReference<Object?> childRef;

  @override
  Widget build(BuildContext context) {
    Color palletYellow = Color.fromRGBO(57, 62, 70, 0.8);
    Color palletePurple = Color.fromRGBO(0, 173, 181, 1);
    String classText = 'The class of your child';
    String nonShownText = 'Days he/she didnt arrive';
    return StreamBuilder(
        stream: childRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
          List<DocumentSnapshot> listOfDocumentSnap = asyncSnapshot.data.docs;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: palletePurple),
                          shape: BoxShape.circle,
                          color: palletYellow,
                        ),
                        child: Center(
                          child: Text(
                            '${listOfDocumentSnap[index]['class']}',
                            style:
                                TextStyle(color: palletePurple, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 300,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: palletePurple),
                        child: Center(
                          child: Text(classText,
                              style:
                                  TextStyle(color: palletYellow, fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 86,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: palletePurple),
                          shape: BoxShape.circle,
                          color: palletYellow,
                        ),
                        child: Center(
                          child: Text(
                            '${listOfDocumentSnap[index]['nonShown']}',
                            style:
                                TextStyle(color: palletePurple, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 300,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle, color: palletePurple),
                        child: Center(
                          child: Text(nonShownText,
                              style:
                                  TextStyle(color: palletYellow, fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: palletYellow,
                        child: Column(
                          children: [
                            Text(
                              'Math',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromRGBO(238, 238, 238, 1)),
                            ),
                            Text(
                              ' ${listOfDocumentSnap[index]['lessons']['Math']}',
                              style:
                                  TextStyle(color: palletePurple, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        color: palletYellow,
                        child: Column(
                          children: [
                            Text(
                              'Physics',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromRGBO(238, 238, 238, 1)),
                            ),
                            Text(
                              ' ${listOfDocumentSnap[index]['lessons']['Physics']}',
                              style:
                                  TextStyle(color: palletePurple, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        });
  }
}
