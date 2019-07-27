import 'package:ex_mvvm_star_wars/models/Character.dart';
import 'package:ex_mvvm_star_wars/widgets/CharactersListItem.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../MainPageViewModel.dart';
import 'NoInternetConnection.dart';

class CharactersPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Character>>(
          future: model.characters,
          builder: (_, AsyncSnapshot<List<Character>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var characters = snapshot.data;
                  return ListView.builder(
                    itemCount: characters == null ? 0 : characters.length,
                    itemBuilder: (_, int index) {
                      var character = characters[index];
                      return CharactersListItem(character: character);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await model.setFilms();
                      await model.setCharacters();
                      await model.setPlanets();
                    },
                  );
                }
            }
          },
        );
      },
    );
  }
}