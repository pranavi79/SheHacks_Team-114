import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

final _firestore = FirebaseFirestore.instance;

class ViewScreen extends StatefulWidget {
  final String name;
  final String about;
  final String contact;
  final String user;
  final String location;
  ViewScreen({this.name, this.about, this.contact, this.location, this.user});

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF5CE1E6),
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.name,
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  textStyle: TextStyle(
                    color: Colors.grey[100],
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                        color: Colors.black45,
                      ),
                      //
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('forms')
            .where('name', isEqualTo: widget.name)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else {
            return Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.cyan[50],
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0),
                      BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          offset: Offset(-6, -2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0)
                    ]),
                height: double.infinity,
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Text(widget.name,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "About:    ",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                widget.about,
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Contact: ",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                widget.contact,
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Location:",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                widget.location,
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Organiser:",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: Text(
                                widget.user,
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                      ],
                    )));
          }
        },
      ),
    );
  }
}
