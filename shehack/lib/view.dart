import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final _firestore = FirebaseFirestore.instance;
class ViewScreen extends StatefulWidget {
  final String name;
  final String about;
  final String contact;
  ViewScreen({this.name,this.about,this.contact});

  @override
  _ViewScreenState createState() => _ViewScreenState();
}
class _ViewScreenState extends State<ViewScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFFF6F6F6),
    appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: widget.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
            ],
          ),
        ),
    ),
    body: StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('forms').where('name',isEqualTo:widget.name).snapshots(),
      builder: (context,snapshot){
        if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }
        else{
          return Container(
            height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(widget.name),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(widget.about),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(widget.contact),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  )
                )
          );
        }
      },
    ),
    );
  }
}