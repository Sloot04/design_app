import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/src/theme/themechanger.dart';
import 'package:backgrounds_custom_painter/src/widgets/radial_progress.dart';

class GraficasCircularesPages extends StatefulWidget {
  @override
  _GraficasCircularesPagesState createState() =>
      _GraficasCircularesPagesState();
}

class _GraficasCircularesPagesState extends State<GraficasCircularesPages> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgres(porcentaje: porcentaje, color: Colors.blue),
              CustomRadialProgres(
                  porcentaje: porcentaje * 1.2, color: Colors.pink),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgres(
                  porcentaje: porcentaje * 1.4, color: Colors.orange),
              CustomRadialProgres(
                  porcentaje: porcentaje * 1.6, color: Colors.purple),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left),
          ),
          SizedBox(
            width: 5.0,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                porcentaje += 10;
                if (porcentaje > 100) {
                  porcentaje = 0.0;
                }
              });
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgres extends StatelessWidget {
  final Color color;
  const CustomRadialProgres({
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      width: 150,
      height: 150,
      child: RadialPrpgress(
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: (appTheme.darkTheme)? Colors.white : Colors.grey.shade500,
        grosorPrimario: 8.0,
        grosorFondo: 4.0,
      ),
    );
  }
}
