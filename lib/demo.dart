
// import 'dart:math';

// import 'package:flutter/material.dart';

// class LoadingCompletionAnimation extends StatefulWidget {
//   @override
//   _LoadingCompletionAnimationState createState() =>
//       _LoadingCompletionAnimationState();
// }

// class _LoadingCompletionAnimationState extends State<LoadingCompletionAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Change duration as needed
//     );
//     _scaleAnimation = Tween<double>(begin: 0.0, end: 1.5)
//         .animate(_controller); // Animation for scale
//     _controller.forward(); // Start the animation
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return _controller.isAnimating
//                 ? Container(
//                     height: 100,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         transform: GradientRotation(15),
//                         colors: [
//                           // Initial gradient
//                           Colors.green,
//                           Colors.white,
//                           Colors.red,
//                         ],
//                         stops: [
//                           0.0,
//                           _controller
//                               .value, // Control the progress of the initial gradient animation
//                           1.0,
//                         ],
//                       ),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 235, 246, 255),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Container(
//                         height: 90,
//                       ),
//                     ),
//                   )
//                 : Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: Container(
//                       // height: 200,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromARGB(255, 137, 230, 140),
//                               width: 8),
//                           color: Colors.white,
//                           shape: BoxShape.circle),
//                       child: Icon(Icons.check_sharp,
//                           size: 80, color: Colors.black),
//                     ));
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose(); // Clean up animation controller
//     super.dispose();
//   }
// }

// // void main() {
// //   runApp(MaterialApp(
// //     home: LoadingCompletionAnimation(),
// //   ));
// // }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Circular Progress Indicator'),
//         ),
//         body: Center(
//           child: CircularProgressBar(),
//         ),
//       ),
//     );
//   }
// }

// class CircularProgressBar extends StatefulWidget {
//   @override
//   _CircularProgressBarState createState() => _CircularProgressBarState();
// }

// class _CircularProgressBarState extends State<CircularProgressBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );

//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _controller.repeat();
//       } else if (status == AnimationStatus.dismissed) {
//         _controller.forward();
//       }
//     });
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: _CircularProgressPainter(
//         animation: _controller,
//         color: Colors.blue, // Change the color as needed
//       ),
//       size: Size.square(150), // Change the size as needed
//     );
//   }
// }

// class _CircularProgressPainter extends CustomPainter {
//   final Animation<double> animation;
//   final Color color;

//   _CircularProgressPainter({required this.animation, required this.color})
//       : super(repaint: animation);

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = color
//       ..strokeWidth = 10.0
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     double progress =
//         animation.value * 2 * pi; // Convert animation value to radians

//     canvas.drawArc(
//       Rect.fromCircle(
//           center: Offset(size.width / 2, size.height / 2),
//           radius: size.width / 2),
//       -pi / 2,
//       progress,
//       false,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class MovingObjectAnimation extends StatefulWidget {
//   const MovingObjectAnimation({super.key});

//   @override
//   _MoveObjectAnimationState createState() => _MoveObjectAnimationState();
// }

// class _MoveObjectAnimationState extends State<MovingObjectAnimation>
//     with SingleTickerProviderStateMixin {
//   int selectedIndex = 0;
//   late AnimationController animationController;
//   late Animation<Offset> moveAnimation;
//   @override
//   void initState() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     )..repeat(reverse: true);
//     moveAnimation = Tween(
//       begin: const Offset(0, 0),
//       end: const Offset(0, 0.2),
//     ).animate(animationController);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SlideTransition(
//             position: moveAnimation,
//             child: AnimatedSwitcher(
//               duration: const Duration(milliseconds: 1000),
//               child:
              
//               // Icon(Icons.tungsten,size: 200,)
              
//               ElevatedButton(
// style: ButtonStyle(
//   backgroundColor: MaterialStatePropertyAll(Colors.amber)
// ),

//                 onPressed: (){}, child: Text("submit"))
//               //  Image.asset("assets/image2.png"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






























