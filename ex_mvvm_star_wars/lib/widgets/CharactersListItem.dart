import 'package:ex_mvvm_star_wars/models/Character.dart';
import 'package:ex_mvvm_star_wars/utils/StarWarsStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CharactersListItem extends StatelessWidget {
  final Character character;

  CharactersListItem({@required this.character});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      character?.name,
      style: TextStyle(
        color: StarWarsStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: StarWarsStyles.titleFontSize,
      ),
    );

    var subTitle = Row(
      children: <Widget>[
        Text(
          character?.birthYear,
          style: TextStyle(
            color: StarWarsStyles.subTitleColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 6.0),
          child: Icon(
            _genderSymbol(),
            color: StarWarsStyles.subTitleColor.withAlpha(200),
            size: StarWarsStyles.subTitleFontSize,
          ),
        ),
      ],
    );

    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            _affiliationSymbol(),
            color: Theme.of(context).primaryColorLight,
            size: 40.0,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: title,
          subtitle: subTitle,
        ),
        Divider(),
      ],
    );
  }

  IconData _affiliationSymbol() {
    switch (character.name) {
      case 'Luke Skywalker':
        return FontAwesomeIcons.jediOrder;
      case 'C-3PO':
        return FontAwesomeIcons.rebel;
      case 'R2-D2':
        return FontAwesomeIcons.rebel;
      case 'Darth Vader':
        return FontAwesomeIcons.empire;
      case 'Leia Organa':
        return FontAwesomeIcons.galacticRepublic;
      case 'Owen Lars':
        return Icons.face;
      case 'Beru Whitesun lars':
        return Icons.face;
      case 'R5-D4':
        return FontAwesomeIcons.rebel;
      case 'Biggs Darklighter':
        return FontAwesomeIcons.rebel;
      case 'Obi-Wan Kenobi':
        return FontAwesomeIcons.jediOrder;
      default:
        return null;
    }
  }

  IconData _genderSymbol() {
    switch (character.gender) {
      case 'male':
        return FontAwesomeIcons.mars;
      case 'female':
        return FontAwesomeIcons.venus;
      case 'n/a':
        return FontAwesomeIcons.robot;
      default:
        return null;
    }
  }
}
