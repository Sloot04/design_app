import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}
//-----------------------------------------------------------

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70.0),
          bottomRight: Radius.circular(70.0),
        ),
      ),
    );
  }
}
//--------------------------------------------------

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //lapiz

    //propiedades
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; --->bordes
    paint.style = PaintingStyle.fill; //relleno
    paint.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//-------------------------------------------------------------------------

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//-------------------------------------------------------------------------

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    path.lineTo(0, size.height * 0.24);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.24);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//---------------------------------------------------------------

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.45, size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    //curva hacia arriba
    /*  path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width *0.5, size.height * 0.10, size.width, size.height * 0.30);
    path.lineTo(size.width, 0); */

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//-------------------------------------------------------------------------

class HeaderWave extends StatelessWidget {
  final Color color;

  const HeaderWave({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {

  final Color color;

  _HeaderWavePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;//Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    //Curva en la parte de abajo
    /* path.moveTo(0, size.height );
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.70,
        size.width * 0.5, size.height * 0.75);
   path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height); */

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//-----------------------------------------------------------------------

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 0.0),
      radius: 180,
    );
    final Gradient gradiente = new LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Colors.orange.shade300,
        Colors.green.shade300,
        Colors.blue,
      ],
      stops: [0.0, 0.5, 1.0],
    );

    final paint = Paint()..shader = gradiente.createShader(rect);

    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//-----------------------------------------------------------------------

class HeaderLateralCurvasGradientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderLateralCurvasGradientes(),
      ),
    );
  }
}

class _HeaderLateralCurvasGradientes extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(180.0, 0.0),
      radius: 180.0,
    );
    final Gradient gradiente = new LinearGradient(
      colors: <Color>[
        Colors.yellow.shade200,
        Colors.green.shade400,
        Colors.blue.shade300,
      ],
      stops: [0.0, 0.5, 1.0],
    );
    final paint = Paint()..shader = gradiente.createShader(rect);
    paint.color = Colors.orange;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();
    path.lineTo(0, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.80, size.height * 0.60,
        size.width * 0.45, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.30, size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//---------------------------------------------------------------------

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(children: [
      _IconHeaderBackground(
        color1: this.color1,
        color2: this.color2,
      ),
      Positioned(
        top: -60,
        left: -55,
        child: FaIcon(
          this.icon,
          size: 200,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      Column(
        children: [
          SizedBox(
            height: 35,
            width: double.infinity,
          ),
          Text(
            this.subtitulo,
            style: TextStyle(
              fontSize: 20,
              color: colorBlanco,
            ),
          ),
          SizedBox(height: 20),
          Text(
            this.titulo,
            style: TextStyle(
                fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          FaIcon(
            this.icon,
            size: 50,
            color: Colors.white,
          ),
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              this.color1,
              this.color2,
            ],
          )),
    );
  }
}
