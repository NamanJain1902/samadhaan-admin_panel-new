import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:samadhan/screens/adminscreen.dart';
import 'package:samadhan/screens/deptscreen.dart';
import 'package:samadhan/screens/home.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

   bool isAuthenticated = false;
   var pName;
   var email;


  void moveToHome() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = await _auth.currentUser();
    if(user != null)
    {
      email = user.email;
      final index = user.email.indexOf('@');
      pName = user.email.substring(0,index);
      print('name $pName');
      setState(() {
        isAuthenticated = true;
      });
      
    }
    await Future.delayed(Duration(milliseconds: 2000)); 
    
    
    // print('result ${user.email}');
    
    
    
    
    if (user == null) {
      
      
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    } else {
      // Navigator.of(context).pushReplacement(Mater)
      
      print('result ${user.email}');
      
      if (email == 'deepakmangla@test.com') {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen();
                            },
                          ));
                        } else {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen1();
                            },
                          ));
                        }
    }
  }

  @override
  void initState() {
    super.initState();
    moveToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: isAuthenticated ? Text(
          'Welcome $pName..',
          style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          ),
        
        ) : SpinKitPouringHourglass(
          color: Colors.black,
          size: 100,
        ),
      ),
    );
  }
}
