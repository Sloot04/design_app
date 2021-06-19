import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/src/theme/themechanger.dart';
import 'package:backgrounds_custom_painter/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  final estilo = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return Scaffold(
      body: HeaderWave(color: accentColor,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_left),
        onPressed: () { 
        Navigator.pop(context);
       },),
    );
  }
}
