import 'package:alimentacion/common/theme.dart';
import 'package:alimentacion/screens/cardDetail.dart';
import 'package:alimentacion/screens/pictureDetail.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Alimentación',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => PictureDetail()
        }
      );
  }
}