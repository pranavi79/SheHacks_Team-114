import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shehack/view.dart';
import 'package:shehack/form.dart';
import 'Profile.dart';
//import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  final User curr;
  HomeScreen({@required this.curr});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  User curr;
  @override
  void initState() {
    curr = widget.curr;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar:AppBar(
      automaticallyImplyLeading: false,
              title: Text("SheHack"),
              leading: MaterialButton(
                elevation: 15,
                shape: CircleBorder(),
                color:Colors.white,

                child: Image.asset('images/Asset 3.png', colorBlendMode: BlendMode.colorDodge),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                              curr: curr,
                            )));
                  }),
              backgroundColor: Colors.blue,
              elevation: 0,
    ),
    body:StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('forms')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  final form = snapshot.data.documents[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ViewScreen(
                          name: form.data()['name'],
                          about: form.data()['about'],
                          contact: form.data()['contact'],
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child:Container(
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              width: 2,
                              color: Colors.black38,
                            )
                            ),
                        child: Row(      
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          form.data()['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Container(
                                          child: null,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    form.data()['about'],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  );
                },
              );
            }
          }),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FormView(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}