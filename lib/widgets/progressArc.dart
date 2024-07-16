import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProgressArc extends CustomPainter{
   bool isBackground;
   double arc;
   Color progresscolor;

  ProgressArc(this.arc,this.isBackground,this.progresscolor);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final rect = Rect.fromLTRB(0, 0, 300, 300);
    final startAngle = math.pi;
    final sweepangle = arc!=null ?arc:math.pi;
    final usercentre = false;
    final paint = Paint()
    ..strokeCap = StrokeCap.round
    ..color = progresscolor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

    if(isBackground){

    }
    canvas.drawArc(rect, startAngle, sweepangle, usercentre, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
  
}