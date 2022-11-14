import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:formatted_text/formatted_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formatted Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final textEditingController = FormattedTextEditingController();

  String _value = '';
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spoiler'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: FormattedText(
                _value,
                isViewMode: true,
              ),
            ),
          ),
          Expanded(
            child: TweenAnimationBuilder(
              duration: const Duration(seconds: 10),
              tween: Tween<double>(begin: 0, end: 100),
              builder: (BuildContext context, double value, Widget? child) {
                return Transform.rotate(
                  angle: value,
                  origin: Offset(2, 20),
                  child: CustomPaint(
                    foregroundPainter: RoundedRectanglePainter(value),
                    child: Container(),
                  ),
                );
              },
              child: const Text('m'),
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: TextField(
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  selectionControls: FormattedTextSelectionControls(
                      actions: FormattedTextDefaults
                          .formattedTextToolbarDefaultActions),
                  // selectionControls: FormattedTextSelectionControls(actions: [
                  //   const FormattedTextToolbarAction(
                  //       label: 'Spoiler', patternChars: '|')
                  // ]),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(_value);
              },
              child: const Text('Get'))
        ],
      ),
    );
  }
}

class RoundedRectanglePainter extends CustomPainter {
  final double value;

  RoundedRectanglePainter(this.value);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(120, 150, 250, 200);
    const startAngle = math.pi;
    const sweepAngle = math.pi;
    const useCenter = false;
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 20)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
