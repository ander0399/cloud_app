import 'package:cloud_app/Gym/ui/widgets/review.dart';
import 'package:flutter/material.dart';


class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/admin1.png", "Soy Admin 1", "1 review · 5 photos", "Buen Ejercicio"),
        Review("assets/img/admin2.pgn", "Soy Admin 2", "2 review · 5 photos", "Excelente"),
        Review("assets/img/admin2.png", "Buen dia", "2 review · 2 photos", "Holaa"),

      ],
    );
  }

}