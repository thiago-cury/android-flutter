import 'package:flutter/material.dart';
import 'package:loja_virtual/model/CartModel.dart';
import 'package:loja_virtual/model/UserModel.dart';
import 'package:loja_virtual/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return ScopedModel(
                              //userModel
              model: CartModel(model),
              child: MaterialApp(
                title: "mmMob Candy\'s Store xxx",
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    primaryColor: Color.fromARGB(255, 4, 125, 141)
                ),
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              ),
            );
          })
    );
  }
}