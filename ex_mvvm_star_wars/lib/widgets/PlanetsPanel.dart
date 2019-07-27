import 'package:ex_mvvm_star_wars/MainPageViewModel.dart';
import 'package:ex_mvvm_star_wars/models/Planet.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'NoInternetConnection.dart';
import 'PlanetsListItem.dart';

class PlanetsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Planet>>(
          future: model.planets,
          builder: (_, AsyncSnapshot<List<Planet>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var planets = snapshot.data;
                  return ListView.builder(
                    itemCount: planets == null ? 0 : planets.length,
                    itemBuilder: (_, int index) {
                      var planet = planets[index];
                      return PlanetsListItem(planet: planet);
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