import 'package:flutter/material.dart';

import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const AnimatedTextFields(),
    );
  }
}

class AnimatedTextFields extends StatefulWidget {
  const AnimatedTextFields({super.key});

  @override
  State<AnimatedTextFields> createState() => _AnimatedTextFieldsState();
}

class _AnimatedTextFieldsState extends State<AnimatedTextFields>
    with SingleTickerProviderStateMixin {
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  bool _isFocused1 = false;
  bool _isFocused2 = false;
  bool _isFocused3 = false;
  @override
  void initState() {
    super.initState();

    _focusNode1.addListener(() {
      setState(() {
        _isFocused1 = _focusNode1.hasFocus;
      });
    });
    _focusNode2.addListener(() {
      setState(() {
        _isFocused2 = _focusNode2.hasFocus;
      });
    });
    _focusNode3.addListener(() {
      setState(() {
        _isFocused3 = _focusNode3.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAnimatedTextField(
                focusNode: _focusNode1,
                isFocused: _isFocused1,
                labelText: "UserName",
                hinttext: 'Enter Your Name',
              ),
              const SizedBox(height: 40.0),
              CustomAnimatedTextField(
                focusNode: _focusNode2,
                isFocused: _isFocused2,
                labelText: "Email",
                hinttext: 'Enter Your Email',
              ),
              const SizedBox(height: 40.0),
              CustomAnimatedTextField(
                focusNode: _focusNode3,
                isFocused: _isFocused3,
                labelText: "Phone",
                hinttext: 'Enter Your Number',
              ),
              ElevatedButton(onPressed: () {}, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedTextField extends StatefulWidget {
  final FocusNode focusNode;
  final bool isFocused;
  final String labelText;
  final String hinttext;

  const CustomAnimatedTextField({
    super.key,
    required this.focusNode,
    required this.isFocused,
    required this.labelText,
    required this.hinttext,
  });

  @override
  _CustomAnimatedTextFieldState createState() =>
      _CustomAnimatedTextFieldState();
}

class _CustomAnimatedTextFieldState extends State<CustomAnimatedTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _alpha;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    final Animation<double> curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeInToLinear);
    _alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    _controller.addListener(() {
      setState(() {});
    });

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            width: widget.isFocused
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.85,
            // width: widget.isFocused ? 350 : 330,
            height: 50,
            decoration: BoxDecoration(
              color: widget.isFocused ? Colors.blue[100] : Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: widget.isFocused
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.transparent,
                  blurRadius: widget.isFocused ? 40.0 : 0.0,
                  spreadRadius: widget.isFocused ? 2.0 : 0.0,
                  offset: const Offset(3, 5),
                ),
              ],
            ),
            child: CustomPaint(
              painter: CustomAnimateBorder(_alpha.value),
              child: TextFormField(
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintText: widget.hinttext,
                  // hintFadeDuration: Duration(seconds: 2),
                  //ENABLE BORDER
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 127, 191, 243)
                          .withOpacity(0.8),
                      width: 0.8,
                    ),
                  ),
                  //FOCUS BORDER
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 127, 191, 243)
                          .withOpacity(0.8),
                      width: 0.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                    borderSide: BorderSide(
                      color:
                          Color.fromARGB(255, 245, 112, 112).withOpacity(0.8),
                      width: 0.5,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  label: Text(
                    "${widget.labelText}\n",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAnimateBorder extends CustomPainter {
  final double animationPercent; // 0.0 to 1.0
  CustomAnimateBorder(this.animationPercent);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.strokeWidth = 1.2;
    paint.color = Color.fromARGB(255, 7, 70, 245).withOpacity(1);
    paint.style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height / 2);

    path.lineTo(0, 8);
    path.quadraticBezierTo(0, 0, 8, 0);
    path.lineTo(size.width - 8, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 8);
    path.lineTo(size.width, size.height / 2);

    var path2 = Path();
    path2.moveTo(0, size.height / 2);

    path2.lineTo(0, size.height - 8);
    path2.quadraticBezierTo(0, size.height, 8, size.height);
    path2.lineTo(size.width - 8, size.height);
    path2.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 8);
    path2.lineTo(size.width, size.height / 2);

    final p1 = Utils.createAnimatedPath(path, animationPercent);
    final p2 = Utils.createAnimatedPath(path2, animationPercent);

    canvas.drawPath(p1, paint);
    canvas.drawPath(p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Utils {
  static Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, ui.PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  static Path extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = new Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
 