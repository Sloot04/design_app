import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  //animaciones
  Animation<double>? moverDerecha;
  Animation<double>? moverArriba;
  Animation<double>? moverIzquierda;
  Animation<double>? moverAbajo;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );
    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));
    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut)));
    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.50, 0.75, curve: Curves.bounceOut)));
    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.reset();
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
      builder: (BuildContext context, Widget? childCuadrado) {
        return  Transform.translate(
                offset: Offset(moverDerecha!.value + moverIzquierda!.value, moverArriba!.value + moverAbajo!.value),
                child: childCuadrado,
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
