// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learnanimation/basicanimation.dart';
import 'package:learnanimation/bottomanimation.dart';
import 'package:learnanimation/heroanimation.dart';
import 'package:learnanimation/moveanimation.dart';
import 'package:learnanimation/pagetrancitionanimation.dart';
import 'package:learnanimation/screenanimation.dart';

void main() {
  timeDilation = 5.0;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Animation Demo',
        // home: AnimatedContainerExample(),
        // home: FirstPage()
        // home: AnimatedExample(),
        // home: AddButtonAnimation(),
        // home: FlashAnimation()
        // home: ScreenAnimation(),
        // home: BottomAnimation(),
        home: HeroAnimation(),
        // home:heroCopy()
        // home:ShoppingCartButton() ,

        // home: MovingObjectAnimation(),

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
              color: isExpanded ? Colors.green : Colors.purpleAccent,
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