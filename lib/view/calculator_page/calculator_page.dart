import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_test/view/calculator_page/widget/button_keyboard.dart';
import 'package:working_test/view/calculator_page/widget/keyboard_user.dart';
import 'package:working_test/view/calculator_page/widget/show_inputUser.dart';
import 'package:working_test/view_model/notivier_provider.dart';

class CalculatorPages extends StatelessWidget {
  final ChangePrimaryNotivier providerRead;
  const CalculatorPages({Key key, this.providerRead}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<ChangePrimaryNotivier>(
          builder: (context, provider, _) =>
              ShowInputUser(provierChanges: provider),
        ),
        KeyboardUser(providerRead: providerRead),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: providerRead.isFieldFull
                  ? () => providerRead.isPrimary(context)
                  : () {
                      Scaffold.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            content: Text("Please Fill the fields first")));
                      return;
                    },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3.0),
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 13.0),
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.headline5,
                  )),
            ),
            buttonIndex(context, providerRead, 0),
            InkWell(
              onTap: () => providerRead.setIntNull(),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3.0),
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Clear',
                    style: Theme.of(context).textTheme.headline5,
                  )),
            )
          ],
        )
      ],
    );
  }
}
