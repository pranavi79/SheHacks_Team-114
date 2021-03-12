import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
final _firestore = FirebaseFirestore.instance;
class FormView extends StatefulWidget{
  @override
  FormViewState createState()=>FormViewState();
}
class FormViewState extends State<FormView>{
  Widget buildGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name of the Event',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter Event\'s Name',
            ),
            onChanged: (input1)=> name = input1,
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
          'Add About the Event',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
              child:TextFormField(
            controller: addTextController,
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'What is this event about?',
            ),
            onChanged: (input2)=> about = input2,
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
          'Contact',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter Phone/Mail/Invite Link/Website',
            ),
            onChanged: (input1)=> contact = input1,
          ),
        ),
      ],
    );
  }
   Widget buildSubmitBtn() {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 5.0,
            onPressed:(){
               _firestore.collection('forms').add({
                'name':name,
                'about':about,
                'contact':contact,
              });
               Navigator.pop(context);
            },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blue,
        child: Text(
          'CREATE',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
    final addTextController = TextEditingController();
    String name;
    String about;
    String contact;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("New Event"),
      ),
      body:   AnnotatedRegion<SystemUiOverlayStyle>(
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
                    vertical: 120.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      buildGroup(),
                      SizedBox(
                        height: 10.0,
                      ),
                      buildAbout(),
                      SizedBox(
                        height: 10.0,
                      ),
                      buildReach(),
                      SizedBox(
                        height: 10.0,
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