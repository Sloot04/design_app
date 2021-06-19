import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/src/theme/themechanger.dart';
import 'package:backgrounds_custom_painter/src/models/layout_model.dart';

import 'package:backgrounds_custom_painter/src/pages/launcher_page.dart';
import 'package:backgrounds_custom_painter/src/pages/launcher_tablet_page.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
            create: (_) => new ThemeChanger(2)),
        ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel())
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientation $orientation');

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
