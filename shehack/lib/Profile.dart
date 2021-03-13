import 'package:shehack/fireauth.dart';
import 'package:shehack/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_profile.dart';


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
    super.initState();

  }

  Widget build(BuildContext context) {
    curr= auth.currentUser;
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
                 //borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
                 color: Color(0xFF5CE1E6),//Color(0xff00ccff),//Colors.pinkAccent,
               ),
               width: (MediaQuery.of(context).size.width),
               child: SafeArea(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Row(
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
                     SizedBox(
                       height: 20,
                     ),
                     CircleAvatar(
                       backgroundColor: Colors.pinkAccent,//Color(0xff00ccff),
                       maxRadius: 40,
                       child: Text(
                           '$initial',
                           style: TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,//Color(0xff00ccff),//Colors.pinkAccent,
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
                              //  Image.asset(
                              //    'images/defaultProfile.png',
                              //    colorBlendMode: BlendMode.colorDodge,
                              //    width: 75,
                              //    height: 75,
                              //  ),
                               SizedBox(
                                 width: 10,
                               ),
                               Text(
                                 '$username',
                                 style: TextStyle(
                                   fontSize: 25.0,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white, //blueAccent,
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
                               backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                             ),


                            ),

                         ],
                       ),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 15.0),//EdgeInsets.all(15.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           SizedBox(
                             width: 10,
                           ),
                           Text(
                             "Email: $mail",
                             style: TextStyle(
                               fontSize: 17.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.white, //blueAccent,
                             ),
                           ),
                         ],
                       ),
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
                             "Phone Number: ",
                             style: TextStyle(
                               fontSize: 17.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.white, //blueAccent,
                             ),
                           ),
                         ],
                       ),
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
                             "Location: ",
                             style: TextStyle(
                               fontSize: 17.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.white, //blueAccent,
                             ),
                           ),
                         ],
                       ),
                     ),

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
          //   color: Colors.pinkAccent,
          // ),
        ),
        //icon: Icon(Icons.thumb_up),
        backgroundColor: Color(0xff00ccff),//Colors.blueAccent,
      ),

      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: Color(0xffccffff),//Colors.blue,//Color(0xff40e0d0),//Colors.blue,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
                color: Color(0xffccffff),//Colors.blue,
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