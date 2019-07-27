import 'package:ex_mvvm_star_wars/MainPage.dart';
import 'package:ex_mvvm_star_wars/services/SwapiService.dart';
import 'package:flutter/material.dart';

import 'MainPageViewModel.dart';

final MainPageViewModel mainPageVM = MainPageViewModel(api: SwapiService());

void main() => runApp(MvvmApp(mainPageVM: mainPageVM));

class MvvmApp extends StatelessWidget {
  final MainPageViewModel mainPageVM;

  MvvmApp({@required this.mainPageVM});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter MVVM Demo',
      theme: new ThemeData(
        primaryColor: Color(0xff070707),
        primaryColorLight: Color(0xff0a0a0a),
        primaryColorDark: Color(0xff000000),
      ),
      home: MainPage(viewModel: mainPageVM),
      debugShowCheckedModeBanner: false,
    );
  }
}