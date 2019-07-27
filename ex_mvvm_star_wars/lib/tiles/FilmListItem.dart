import 'package:ex_mvvm_star_wars/models/Film.dart';
import 'package:ex_mvvm_star_wars/utils/StarWarsStyles.dart';
import 'package:flutter/material.dart';

class FilmsListItem extends StatelessWidget {
  final Film film;

  FilmsListItem({@required this.film});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      film?.title,
      style: TextStyle(
        color: StarWarsStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: StarWarsStyles.titleFontSize,
      ),
    );

    var subTitle = Row(
      children: <Widget>[
        Icon(
          Icons.movie,
          color: StarWarsStyles.subTitleColor,
          size: StarWarsStyles.subTitleFontSize,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            film?.director,
            style: TextStyle(
              color: StarWarsStyles.subTitleColor,
            ),
          ),
        ),
      ],
    );

    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: title,
          subtitle: subTitle,
        ),
        Divider(),
      ],
    );
  }
}