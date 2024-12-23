import 'package:cloud_app/User/bloc/bloc_user.dart';
import 'package:cloud_app/User/model/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_app/Widgets/gradient_back.dart';
import 'package:cloud_app/Widgets/ButtonBlue.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cloud_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_app/VitalfitApp.dart';

class SignInScreen extends StatefulWidget {

  @override
  State createState() {
    return _SignInScreen();
   }
}

class _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return  _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return VitalfitApp();
        }
      },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack(height: null),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/img/logo.png')),
                Text("",
                  style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),

                ),
                ButtonBlue(
                  text: "Entrar con Gmail",
                    onPressed: (){
                    userBloc.signOut();
                    userBloc.signIn().then((auth.User a ){
                      userBloc.updateUserData(User(
                        uId: a.uid,
                        name: a.displayName,
                        email: a.email,
                        photoURL: a.photoURL
                      ));
                    });
                },
                width: 300.0,
                height: 50.0,
                ),

              ],
            )
          ]
      ),

    );
  }
}