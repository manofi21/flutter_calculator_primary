import 'package:flutter/material.dart';
import 'package:working_test/view/calculator_page/widget/button_keyboard.dart';
import 'package:working_test/view_model/notivier_provider.dart';

class KeyboardUser extends StatelessWidget {
  final ChangePrimaryNotivier providerRead;
  const KeyboardUser({Key key, this.providerRead}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      children: List.generate(9, (index) {
        return buttonIndex(context, providerRead, index + 1);
      }),
    );
  }
}
