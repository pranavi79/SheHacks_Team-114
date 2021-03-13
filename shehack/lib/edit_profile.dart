import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shehack/Profile.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool showSpinner=false;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _controller;
  User curr;
  String username;

  @override
  Widget build(BuildContext context) {
    curr= auth.currentUser;
    username=curr.displayName;
    _controller = new TextEditingController(text: '$username');
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5CE1E6),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit Profile',
                style:GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
              FlatButton(

                onPressed: ()async{
                  if(username!=null&& username!='') {
                    setState(() {
                      showSpinner=true;
                    });
                    try {
                      await curr.updateProfile(displayName: username);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(curr: curr),
                          )
                      );
                      setState(() {
                        showSpinner=false;
                      });
                    }
                    catch (e) {
                      Fluttertoast.showToast(
                          msg: e.message,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Display name can not be empty",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }

                },
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Color(0xFF5CE1E6),
              ),

            ],
          ),

        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image.asset(
                //   'images/defaultProfile.png',
                //   colorBlendMode: BlendMode.colorDodge,
                //   width: 75,
                //   height: 75,
                // ),
                // FlatButton(
                //   onPressed: (){},
                //   child: Text(
                //       'Edit Profile Picture'
                //   ),
                  //color: Colors.white,
                //),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 73,
                    ),

                    Container(
                      width: 250,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value){
                          //await curr.updateProfile(displayName: value);
                          username=value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Phone number:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Container(
                      width: 250,
                      child: TextField(
                        //controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value){
                          //await curr.updateProfile(displayName: value);
                          //username=value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Location/City:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 19,
                    ),

                    Container(
                      width: 250,
                      child: TextField(
                        //controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value){
                          //await curr.updateProfile(displayName: value);
                          //username=value;
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

      ),
    );

  }
}

// class EditProfile extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //       children: [
//     //         Text(
//     //           'Edit Profile',
//     //           style: TextStyle(
//     //             color: Colors.white,
//     //             fontWeight: FontWeight.bold,
//     //           ),
//     //         ),
//     //         FlatButton(
//     //             onPressed: (){
//     //               Navigator.pop(context);
//     //             },
//     //             child: Text(
//     //               'SAVE',
//     //               style: TextStyle(
//     //                 color: Colors.white,
//     //               ),
//     //             ),
//     //           color: Colors.blue,
//     //         ),
//     //
//     //       ],
//     //     ),
//     //
//     //   ),
//     //   body: Padding(
//     //     padding: const EdgeInsets.all(8.0),
//     //     child: Column(
//     //       crossAxisAlignment: CrossAxisAlignment.stretch,
//     //       children: [
//     //
//     //         Image.asset(
//     //           'images/defaultProfile.png',
//     //           colorBlendMode: BlendMode.colorDodge,
//     //           width: 75,
//     //           height: 75,
//     //         ),
//     //         FlatButton(
//     //             onPressed: (){},
//     //             child: Text(
//     //               'Edit Profile Picture'
//     //             ),
//     //           //color: Colors.white,
//     //         ),
//     //         SizedBox(
//     //           height: 10,
//     //         ),
//     //         Row(
//     //           mainAxisAlignment: MainAxisAlignment.start,
//     //           children: [
//     //             Text(
//     //               'Name',
//     //               style: TextStyle(
//     //                 fontWeight: FontWeight.bold,
//     //               ),
//     //             ),
//     //             // TextField(
//     //             //   controller: _controller,
//     //             //   onSubmitted: (String value)async{
//     //             //     await curr.updateProfile(displayName: value);
//     //             //   },
//     //             // ),
//     //
//     //
//     //
//     //               ],
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }