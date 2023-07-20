import 'package:flutter/material.dart';

class ShapeCreator extends StatefulWidget {
  @override
  _ShapeCreatorState createState() => _ShapeCreatorState();
}

class _ShapeCreatorState extends State<ShapeCreator> {
  String selectedShape = '';

  void selectShape(String shape) {
    setState(() {
      selectedShape = shape;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShapeButton(
              shape: 'Triangle',
              isSelected: selectedShape == 'Triangle',
              onTap: () => selectShape('Triangle'),
            ),
            ShapeButton(
              shape: 'Rectangle',
              isSelected: selectedShape == 'Rectangle',
              onTap: () => selectShape('Rectangle'),
            ),
            ShapeButton(
              shape: 'Circle',
              isSelected: selectedShape == 'Circle',
              onTap: () => selectShape('Circle'),
            ),
            ShapeButton(
              shape: 'Square',
              isSelected: selectedShape == 'Square',
              onTap: () => selectShape('Square'),
            ),
            ShapeButton(
              shape: 'Diamond',
              isSelected: selectedShape == 'Diamond',
              onTap: () => selectShape('Diamond'),
            ),
          ],
        ),
      ),
      bottomSheet: selectedShape.isNotEmpty
          ? Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: CustomPaint(
                  size: Size(100, 100),
                  painter: ShapePainter(shape: selectedShape),
                ),
              ),
            )
          : null,
    );
  }
}

class ShapeButton extends StatelessWidget {
  final String shape;
  final bool isSelected;
  final Function onTap;

  ShapeButton(
      {required this.shape, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            shape,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final String shape;

  ShapePainter({required this.shape});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;

    switch (shape) {
      case 'Triangle':
        canvas.drawPath(getTrianglePath(size), paint);
        break;
      case 'Rectangle':
        canvas.drawRect(Offset.zero & size, paint);
        break;
      case 'Circle':
        canvas.drawCircle(
            Offset(size.width / 2, size.height / 2), size.width / 2, paint);
        break;
      case 'Square':
        canvas.drawRect(Offset.zero & size, paint);
        break;
      case 'Diamond':
        canvas.drawPath(getDiamondPath(size), paint);
        break;
    }
  }

  Path getTrianglePath(Size size) {
    return Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..close();
  }

  Path getDiamondPath(Size size) {
    return Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
