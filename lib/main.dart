// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learnanimation/basicanimation.dart';
import 'package:learnanimation/bottomanimation.dart';
import 'package:learnanimation/heroanimation.dart';
import 'package:learnanimation/moveanimation.dart';
import 'package:learnanimation/pagetrancitionanimation.dart';
import 'package:learnanimation/screenanimation.dart';
import 'dart:math' as math;

void main() {
  // timeDilation = 5.0;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      // home: AnimatedContainerExample(),
      // home: FirstPage()
      // home: AnimatedExample(),
      // home: AddButtonAnimation(),
      // home: FlashAnimation()
      // home: ScreenAnimation(),
      // home: BottomAnimation(),
      // home: HeroAnimation(),

      // home:ShoppingCartButton() ,

      home: BounceAnimation(),
    );
  }
}

class CardFlipAnimation extends StatefulWidget {
  const CardFlipAnimation({super.key});

  @override
  createState() => _CardFlipAnimationState();
}

class _CardFlipAnimationState extends State<CardFlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_controller.status != AnimationStatus.forward) {
      if (_isFront) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isFront = !_isFront;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _flipCard,
        child: Center(
          child: SizedBox(
            width: 180,
            height: 180,
            child: Transform(
                transform: Matrix4.rotationY(_animation.value * math.pi),
                alignment: Alignment.center,
                child: _isFront
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/image3.png"),
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(3.14),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 56, 90, 142),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Flutter',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      )),
          ),
        ),
      ),
    );
  }

  Widget _buildFront() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset("assets/image3.png"),
    );
  }

  Widget _buildBack() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(3.14),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 56, 90, 142),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Flutter',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart Button Animation"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            height: 70,
            width: isExpanded ? 220 : 90,
            decoration: BoxDecoration(
              color:
                  isExpanded ? Colors.green : Color.fromARGB(255, 64, 123, 251),
              borderRadius: BorderRadius.circular(isExpanded ? 50 : 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isExpanded) const SizedBox(width: 25),
                Icon(
                  isExpanded ? Icons.check : Icons.shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
                // for space between add to cart text and icon
                if (isExpanded) const SizedBox(width: 5),
                // for text  in check icon only
                if (isExpanded)
                  const Expanded(
                    child: Text(
                      "Add to Cart",
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
