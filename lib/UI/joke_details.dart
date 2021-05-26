import 'package:flutter/material.dart';
import 'package:the_joke_app/Model/Joke.dart';

class JokeDetails extends StatelessWidget {
  final bool isTabletLayout;
  final Joke joke;

  JokeDetails({@required this.isTabletLayout, @required this.joke});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.setup ?? "No joke selected.",
            style: textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.punchline ?? "Please select a joke on the left",
            style: textTheme.subtitle1,
          ),
        )
      ],
    );

    if (isTabletLayout) {
      return Center(
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? "no jokes"),
      ),
      backgroundColor: Colors.yellow.shade50,
      body: Center(
        child: content,
      ),
    );
  }
}
