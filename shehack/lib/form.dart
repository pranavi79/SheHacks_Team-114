import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final _firestore = FirebaseFirestore.instance;

class FormView extends StatefulWidget {
  @override
  FormViewState createState() => FormViewState();
}

class FormViewState extends State<FormView> {
  Widget buildGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Create new Event',
          style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 40.0),
        Text(
          "Event Title",
          style: GoogleFonts.montserrat(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0XFFEFF3F6),
              borderRadius: BorderRadius.circular(30.0),
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
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            style: GoogleFonts.raleway(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              border: InputBorder.none,
              hintText: 'Enter Event\'s Name',
            ),
            onChanged: (input1) => name = input1,
          ),
        ),
      ],
    );
  }

  Widget buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Description",
          style: GoogleFonts.montserrat(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0XFFEFF3F6),
              borderRadius: BorderRadius.circular(30.0),
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
          child: TextFormField(
            controller: addTextController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: GoogleFonts.raleway(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              border: InputBorder.none,
              hintText: 'What is this event about?',
            ),
            onChanged: (input2) => about = input2,
          ),
        ),
      ],
    );
  }

  Widget buildLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Location",
          style: GoogleFonts.montserrat(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0XFFEFF3F6),
              borderRadius: BorderRadius.circular(100.0),
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
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            style: GoogleFonts.raleway(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              border: InputBorder.none,
              hintText: 'Enter City/Locality',
            ),
            onChanged: (input3) => location = input3,
          ),
        ),
      ],
    );
  }

  Widget buildReach() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "To know more",
          style: GoogleFonts.montserrat(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0XFFEFF3F6),
              borderRadius: BorderRadius.circular(100.0),
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
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            style: GoogleFonts.raleway(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              border: InputBorder.none,
              hintText: 'Enter Phone/Mail/Invite Link/Website',
            ),
            onChanged: (input4) => contact = input4,
          ),
        ),
      ],
    );
  }

  Widget buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: 130,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          _firestore.collection('forms').add({
            'name': name,
            'about': about,
            'location': location,
            'contact': contact,
            'user': FirebaseAuth.instance.currentUser.displayName,
            'interestedPeople': [],
          });
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF5CE1E6),
        child: Text(
          'CREATE',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            textStyle: TextStyle(
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 3.0,
                  color: Colors.cyan[700],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final addTextController = TextEditingController();
  String name;
  String about;
  String contact;
  String location;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Event",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(
              color: Colors.grey[100],
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 3.0,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFF5CE1E6),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 30.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      buildGroup(),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildAbout(),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildLocation(),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildReach(),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildSubmitBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
