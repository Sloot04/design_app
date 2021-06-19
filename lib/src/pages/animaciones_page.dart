import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_left),
        onPressed: () { 
        Navigator.pop(context);
       },),
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? rotacion;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;
  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  get status => null;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0,
          0.30,
          curve: Curves.easeOut,
        )));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.75,
          1.0,
          curve: Curves.easeOut,
        )));

    moverDerecha = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    // Como yo lo resolví;
    /* opacidadOut = Tween(begin: 0.45, end: 0.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.50,
          1.0,
          curve: Curves.easeOut,
        ))); */

    controller!.addListener(() {
      //print({'Status:', controller!.status});
      if (controller!.status == AnimationStatus.completed) {
        //controller!.reverse();
        controller!.reset();
        //controller!.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward();
    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        // print({'Rotacion:', rotacion!.value});

        return /* Opacity(  //--->Como yo lo resolví;
          opacity: opacidadOut!.value,
          child:  */
            Transform.translate(
          offset: Offset(moverDerecha!.value, 0),
          child: Transform.rotate(
            angle: rotacion!.value,
            child: Opacity(
              opacity: opacidad!.value -opacidadOut!.value,
              child: Transform.scale(
                scale: agrandar!.value,
                child: childRectangulo,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
