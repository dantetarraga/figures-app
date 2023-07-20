import 'package:app_kids/widgets/figure_type.dart';
import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  final Color color;
  final FigureType figureType;

  CustomShapePainter({required this.color, required this.figureType});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path;

    switch (figureType) {
      case FigureType.triangle:
        path = _createTrianglePath(size);
        break;
      case FigureType.circle:
        path = _createCirclePath(size);
        break;
      case FigureType.rectangle:
        path = _createRectanglePath(size);
        break;
      case FigureType.diamond:
        path = _createDiamondPath(size);
        break;
      case FigureType.square:
        path = _createSquarePath(size);
        break;
    }

    canvas.drawPath(path, paint);
  }

  Path _createTrianglePath(Size size) {
    return Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  Path _createCirclePath(Size size) {
    return Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
  }

  Path _createRectanglePath(Size size) {
    return Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
  }

  Path _createDiamondPath(Size size) {
    return Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
  }

  Path _createSquarePath(Size size) {
    final sideLength = size.width < size.height ? size.width : size.height;
    return Path()..addRect(Rect.fromLTWH(0, 0, sideLength, sideLength));
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) {
    return color != oldDelegate.color || figureType != oldDelegate.figureType;
  }
}
