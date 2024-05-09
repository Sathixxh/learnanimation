// import 'package:flutter/material.dart';

// class BounceAnimation extends StatefulWidget {
//   const BounceAnimation({super.key});

//   @override
//   _MoveObjectAnimationState createState() => _MoveObjectAnimationState();
// }

// class _MoveObjectAnimationState extends State<BounceAnimation>
//     with SingleTickerProviderStateMixin {
//   int selectedIndex = 0;
//   late AnimationController animationController;
//   late Animation<Offset> moveAnimation;
//   @override
//   void initState() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat(reverse: true);
//     moveAnimation = Tween(
//       begin: const Offset(0, 0),
//       end: const Offset(0, 0.03),
//     ).animate(animationController);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: const Color.fromARGB(255, 41, 41, 41),
//       body: SafeArea(
//         child: Center(
//           child: SlideTransition(
//             position: moveAnimation,
// child: Icon(Icons.flight_sharp,size: 200,),

//             // child: Image.asset(
//             //  "assets/image3.png",height: 300 , width: 300,
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  const BounceAnimation({Key? key}) : super(key: key);

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> moveAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    moveAnimation = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, -3), 
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _handleFlightIconTap() {
    // animationController.reset();
    animationController.forward();
    // animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: _handleFlightIconTap,
            child: SlideTransition(
              position: moveAnimation,
              child: Icon(Icons.flight_sharp, size: 200),
            ),
          ),
        ),
      ),
    );
  }
}




