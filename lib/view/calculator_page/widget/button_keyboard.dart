import 'package:flutter/material.dart';
import 'package:working_test/view_model/notivier_provider.dart';

Widget buttonIndex(
    BuildContext context, ChangePrimaryNotivier providerRead, int index) {
  return Center(
    child: InkWell(
      onTap: providerRead.isFieldFull
          ? () {
              Scaffold.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                    SnackBar(content: Text("Please clear the field first")));
              return;
            }
          : () => providerRead.setInt = index,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3.0),
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(35.0),
        child: Text(
          '$index',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    ),
  );
}
