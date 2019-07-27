import 'dart:async';

import 'models/Character.dart';
import 'models/Film.dart';
import 'models/Planet.dart';

abstract class IStarWarsApi {
  Future<List<Film>> getFilms();
  Future<List<Character>> getCharacters();
  Future<List<Planet>> getPlanets();
}