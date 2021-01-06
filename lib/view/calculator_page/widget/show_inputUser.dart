import 'package:flutter/material.dart';
import 'package:working_test/view_model/notivier_provider.dart';

class ShowInputUser extends StatelessWidget {
  final ChangePrimaryNotivier provierChanges;
  const ShowInputUser({Key key, this.provierChanges}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            (provierChanges.firstInt ?? '_').toString(),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            (provierChanges.lastInt ?? '_').toString(),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}
