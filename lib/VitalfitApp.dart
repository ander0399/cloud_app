import 'package:cloud_app/Gym/ui/screens/HomeExercise.dart';
import 'package:cloud_app/Gym/ui/screens/search_exercise.dart';
import 'package:cloud_app/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_app/User/ui/screens/ProfileGym.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class VitalfitApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.amber),
                  label: ("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.amber),
                  label: ("")
              ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.shopping_bag_outlined, color: Colors.amber),
                  label: ("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.amber),
                  label: ("")
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeExercise(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchExercise(),
              );
              break;
              case 2:
            return CupertinoTabView(
              builder: (BuildContext context) => SearchExercise(),
            );
            break;
            case 3:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: ProfileGym(),
                  );
                  },
              );
              break;

          }

        },
      ),
    );
  }

}