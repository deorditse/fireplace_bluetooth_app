import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlockFireplace extends StatelessWidget {
  const BlockFireplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _blockFirePlace(context),
        SizedBox(height: 15),
        _timeWork(context),
        SizedBox(height: 30),
        Expanded(child: _textField(context)),
      ],
    );
  }

  Widget _blockFirePlace(context) {
    return MyContainerAlert(
      colorBorder: myColorActivity,
      child: Text('камин заблокирован',
          style: myTextStyleFontRoboto(
            fontSize: 24,
            textColor: myColorActivity,
          )),
    );
  }

  Widget _timeWork(BuildContext context) {
    return MyContainerAlert(
      width: MediaQuery.of(context).size.width * 0.7,
      child: FittedBox(
        child: Column(
          children: [
            Text(
              'время работы',
              style: myTextStyleFontSarpanch(
                fontSize: 24,
                textColor: myTwoColor,
              ),
            ),
            Text(
              '00:00:00',
              style: myTextStyleFontSarpanch(
                fontSize: 24,
                textColor: myTwoColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textField(context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          'введите пароль',
          style: myTextStyleFontRoboto(
            fontSize: 24,
            textColor: myTwoColor,
          ),
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: SizedBox(
                // height: 40,
                width: MediaQuery.of(context).size.width / 2.5,
                child: _myTextField(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 6,
              child: Image.asset(
                'assets/icons/mainBlock.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ],
  );
}

TextField _myTextField() {
  final textController = FireplaceConnectionGetXController.instance;
  return TextField(
    maxLength: 4,
    controller: textController.textFieldPassword,
    onChanged: (password) {
      if (password == textController.passwordBlock.toString()) {
        FireplaceConnectionGetXController.instance.isBlocButton.value = false;
        textController.textFieldPassword.clear();
      }
    },
    textAlign: TextAlign.center,
    style: myTextStyleFontRoboto(textColor: myColorActivity, fontSize: 24),
    decoration: InputDecoration(
      focusColor: myColorActivity,
      hoverColor: myColorActivity,
      filled: true,
      fillColor: myTwoColor,
      border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
    // keyboardType: TextInputType.number,
    keyboardType: TextInputType.visiblePassword,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.singleLineFormatter,
    ],
    obscureText: true,

    //
    // keyboardType: TextInputType.number,
    // inputFormatters: <TextInputFormatter>[
    //   FilteringTextInputFormatter.singleLineFormatter,
    // ],
    // obscureText: true,
    obscuringCharacter: '*',

    cursorColor: myColorActivity,
  );
}
