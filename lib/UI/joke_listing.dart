import 'package:flutter/material.dart';
import 'package:the_joke_app/Model/Joke.dart';

class JokeListing extends StatelessWidget {
  final ValueChanged<Joke> jokeSelectedCallBack;
  final Joke jokeSelected;

  const JokeListing(
      {Key key, @required this.jokeSelectedCallBack, this.jokeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((tempJoke) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Container(
            child: ListTile(
              title: Text(tempJoke.setup),
              onTap: () => jokeSelectedCallBack(tempJoke),
              selected: jokeSelected == tempJoke,
            ),
            decoration: BoxDecoration(
                color: Colors.orange.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)),
          ),
        );
      }).toList(),
    );
  }
}
