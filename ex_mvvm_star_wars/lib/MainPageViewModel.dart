import 'dart:async';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';

import 'IStarWarsAPI.dart';
import 'models/Film.dart';
import 'models/Character.dart';
import 'models/Planet.dart';

class MainPageViewModel extends Model {

  //FILMS
  Future<List<Film>> _films;

  Future<List<Film>> get films => _films;

  set films(Future<List<Film>> value) {
    _films = value;
    notifyListeners();
  }

  //CHARACTERS
  Future<List<Character>> _characters;

  Future<List<Character>> get characters => _characters;

  set characters(Future<List<Character>> value) {
    _characters = value;
    notifyListeners();
  }

  //PLANETS
  Future<List<Planet>> _planets;

  Future<List<Planet>> get planets => _planets;

  set planets(Future<List<Planet>> value) {
    _planets = value;
    notifyListeners();
  }

  //API
  final IStarWarsApi api;

  MainPageViewModel({@required this.api});

  Future<bool> setFilms() async {
    films = api?.getFilms();
    return films != null;
  }

  Future<bool> setCharacters() async {
    characters = api?.getCharacters();
    return characters != null;
  }

  Future<bool> setPlanets() async {
    planets = api?.getPlanets();
    return planets != null;
  }
}