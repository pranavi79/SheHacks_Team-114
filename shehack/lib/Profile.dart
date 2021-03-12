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

  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
    curr= auth.currentUser;
    username=curr.displayName;
  
    return Scaffold(
      body:Column(
          children: <Widget>[
           Expanded(
             flex: 1,
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
                 color: Colors.blueAccent,
               ),
               width: (MediaQuery.of(context).size.width),
               child: SafeArea(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                           padding: EdgeInsets.only(left: 15.0,top: 20.0,right:15.0),// EdgeInsets.all(15.0),
                           child: Text(
                             "Welcome to Your Profile",
                             style: TextStyle(
                               fontSize: 25.0,
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
                     Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
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
                          //  ElevatedButton(
                          //    onPressed:(){
                          //      Navigator.push(context, MaterialPageRoute(
                          //          builder: (context) => EditProfile(),
                          //      )
                          //      );
                          //      },
                          //    child: Text(
                          //      'Edit Profile',
                          //      style: TextStyle(
                          //        color: Colors.blueAccent
                          //      ),
                          //    ),
                          //    style: ButtonStyle(
                          //      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          //    ),


                          //  ),

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
        label: Text('Sign Out'),
        //icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.blueAccent,
      ),

      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: Colors.blue,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
                color: Colors.blue,
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