import 'package:cloud_app/User/ui/screens/ProfileHeader.dart';
import 'package:cloud_app/User/ui/widgets/ProfileBackground.dart';
import 'package:cloud_app/User/ui/widgets/ProfileExerciseList.dart';
import 'package:flutter/material.dart';


class ProfileGym extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfileExerciseList()

          ],
        ),
      ],
    );
  }

}