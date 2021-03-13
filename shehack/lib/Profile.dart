import 'package:shehack/fireauth.dart';
import 'package:shehack/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_profile.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatefulWidget {
  final User curr;

  Profile({this.curr});

  @override
  _ProfileState createState() => _ProfileState();

}


class _ProfileState extends State<Profile> {
  final _fire=fireauth();
  FirebaseAuth auth = FirebaseAuth.instance;
  User curr;
  String username;
  String initial;
  String mail;

  @override
  void initState() {
    curr= widget.curr;
    super.initState();

  }

  Widget details(String details){
    return Column(
      children: [
        SizedBox(
          height:5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                details,
                style: GoogleFonts.montserrat(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, //blueAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    //curr=auth.currentUser;
    username=curr.displayName;
    mail=curr.email;
    initial= username.substring(0,1);
  
    return Scaffold(
      body:Column(
          children: <Widget>[
           Expanded(
             flex: 1,
             child: Container(
               decoration: BoxDecoration(
                 color: Color(0xffccffff),//Color(0xff00ccff),//Color(0xFF5CE1E6),
               ),
               width: (MediaQuery.of(context).size.width),
               child: SafeArea(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                          color: Color(0xFF5CE1E6),
                 //Color(0xff00ccff),
                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
                        ),
                       child: Row(

                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Padding(
                             padding: EdgeInsets.only(left: 15.0,top: 20.0,right:15.0),// EdgeInsets.all(15.0),
                             child: Text(
                               "Welcome to Your Profile",
                               style: TextStyle(
                                 fontSize: 28.0,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white, //blueAccent,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(15.0),
                             child: BackButton(
                               color: Colors.white,
                               onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(
                                   builder: (context) => HomeScreen(curr: curr),
                                 )
                                 );
                               },
                             ),
                           )
                         ],
                       ),
                     ),
                     SizedBox(
                       height: 40,
                     ),
                     CircleAvatar(
                       backgroundColor: Color(0xFF5CE1E6),//Color(0xff00ccff),
                       maxRadius: 45,
                       child: Text(
                           '$initial',
                           style: TextStyle(
                             fontSize: 35.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,//Color(0xff00ccff),//Color(0xFF5CE1E6),
                           ),
                       ),
                     ),
                     SizedBox(
                       height: 40,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,

                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(
                                 width: 10,
                               ),
                               Text(
                                 '$username',
                                 style: GoogleFonts.montserrat(
                                   fontSize: 25.0,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black, //blueAccent,
                                 ),
                               ),
                             ],
                           ),
                           ElevatedButton(
                             onPressed:(){
                               Navigator.push(context, MaterialPageRoute(
                                   builder: (context) => EditProfile(),
                               )
                               );
                               },
                             child: Text(
                               'Edit Profile',
                               style: TextStyle(
                                 color: Colors.white,//Color(0xff00ccff),
                               ),
                             ),
                             style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5CE1E6)),
                             ),


                            ),

                         ],
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),

                     details("Email: $mail"),
                     details("Phone no:"),
                     details("Location:"),
                   ],

                 ),
               ),
             ),
           ),
          ]
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          _fire.out();
          Phoenix.rebirth(context);
        },
        label: Text(
            'Sign Out',
          // style: TextStyle(
          //   color: Color(0xFF5CE1E6),
          // ),
        ),
        //icon: Icon(Icons.thumb_up),
        backgroundColor: Color(0xFF5CE1E6),//Color(0xff00ccff),//Colors.blueAccent,
      ),

      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: Color(0xFF5CE1E6),//Colors.blue,//Color(0xff40e0d0),//Colors.blue,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
                color: Color(0xff66ccff),//Colors.blue,
              ),

            ],
          ),
          //child: bottomAppBarContents,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}