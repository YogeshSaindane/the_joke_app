import 'package:flutter/material.dart';
import 'package:the_joke_app/Model/Joke.dart';
import 'package:the_joke_app/UI/joke_details.dart';
import 'package:the_joke_app/UI/joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tabletBreakpoint = 600;
  Joke selectedJoke;
  Widget mobileLayout() {
    return JokeListing(jokeSelectedCallBack: (jokeSelected) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return JokeDetails(isTabletLayout: false, joke: jokeSelected);
      }));
    });
  }

  Widget tabletLayout() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
            elevation: 15,
            child: JokeListing(
              jokeSelectedCallBack: (jokeSelected) {
                setState(() {
                  selectedJoke = jokeSelected;
                });
              },
              jokeSelected: selectedJoke,
            ),
          ),
        ),
        Flexible(
            flex: 3,
            child: JokeDetails(isTabletLayout: true, joke: selectedJoke))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait &&
        shortestSide < tabletBreakpoint) {
      content = mobileLayout();
    } else {
      content = tabletLayout();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: content,
    );
  }
}
