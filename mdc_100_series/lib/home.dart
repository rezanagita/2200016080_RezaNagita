import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // TODO: Add app bar (102)
      // TODO: Add a grid view (102)
      body: GridView.count(
        crossAxisCount: 2, //jumlah kolom
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        //TODO: Build a grid of cards (102)
        children: <Widget>[Card()],
      ),
      // TODO: Set resizeToAvoidBottomInset (101)
      resizeToAvoidBottomInset: false,
    );
  }
}
