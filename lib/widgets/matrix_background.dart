import 'package:flutter/material.dart';
import 'dart:math';

class MatrixBackground extends StatefulWidget {
  const MatrixBackground({Key? key}) : super(key: key);

  @override
  _MatrixBackgroundState createState() => _MatrixBackgroundState();
}

class _MatrixBackgroundState extends State<MatrixBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> _chars = 'アァイィウヴエェオカガキギクグケゲコゴサザシジスズセゼソゾタダチッヂヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモヤユヨラリルレロワヲン'.split('');
  final List<MatrixColumn> _columns = [];
  final int _fontSize = 14;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 70),
    )..addListener(() => setState(() {}))
      ..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final columnCount = width ~/ _fontSize;
    _columns.clear();
    for (int i = 0; i < columnCount; i++) {
      _columns.add(MatrixColumn(
        x: (i * _fontSize).toDouble(),
        y: Random().nextInt(height.toInt()),
        fontSize: _fontSize,
        chars: _chars,
        height: height.toInt(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MatrixPainter(columns: _columns),
      child: Container(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MatrixColumn {
  double x;
  int y;
  int fontSize;
  List<String> chars;
  int height;
  Random random = Random();

  MatrixColumn({
    required this.x,
    required this.y,
    required this.fontSize,
    required this.chars,
    required this.height,
  });

  void draw(Canvas canvas, Paint paint) {
    final textPainter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < 20; i++) {
      final char = chars[random.nextInt(chars.length)];
      textPainter.text = TextSpan(
        text: char,
        style: TextStyle(
          color: Colors.greenAccent.withOpacity(1 - i * 0.05),
          fontSize: fontSize.toDouble(),
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x, (y - i * fontSize).toDouble()));
    }

    y += fontSize;
    if (y > height + 100) {
      y = random.nextInt(100);
    }
  }
}

class MatrixPainter extends CustomPainter {
  final List<MatrixColumn> columns;

  MatrixPainter({required this.columns});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (var column in columns) {
      column.draw(canvas, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
