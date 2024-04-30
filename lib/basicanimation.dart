import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 15.0;
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 5000),
          width: _isExpanded ? 300 : 100,
          height: _isExpanded ? 300 : 100,
          color: Colors.blue,
          child: Center(
            child: Text(
              _isExpanded ? 'Expanded' : 'Collapsed',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleExpansion,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

class AnimatedExample extends StatefulWidget {
  @override
  _AnimatedExampleState createState() => _AnimatedExampleState();
}

class _AnimatedExampleState extends State<AnimatedExample> {
  bool _visible = false;
  bool _isExpanded = false;
  bool _isRotated = false;
  bool _isSlided = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.autorenew_rounded),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 3000),
                child: const Icon(
                  Icons.view_in_ar_outlined,
                  size: 100,
                ),
              ),
              const SizedBox(height: 20.0),
              AnimatedContainer(
                duration: const Duration(milliseconds: 3000),
                width: _isExpanded ? 100.0 : 70.0,
                height: _isExpanded ? 100.0 : 70.0,

decoration: BoxDecoration(
  
                  color: _isExpanded ? Colors.blue :Colors.amber,
  
   borderRadius: _isExpanded?   BorderRadius.all(Radius.circular(30.0)):BorderRadius.all(Radius.zero)),
              ),
              const SizedBox(height: 20.0),
              AnimatedContainer(
                duration: const Duration(milliseconds: 3000),
                transform: Matrix4.rotationZ(_isRotated ? 0.9 : 0),
                child: const Flexible(
                  child: Icon(
                    Icons.verified,
                    size: 100,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              AnimatedContainer(
                duration: const Duration(milliseconds: 3000),
                transform: Matrix4.translationValues(
                    _isSlided ? 300.0 : 0.0, 0.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: const Color.fromARGB(255, 12, 18, 22),
                ),
              ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                    _isExpanded = !_isExpanded;
                    _isRotated = !_isRotated;
                    _isSlided = !_isSlided;
                  });
                },
                child: const Text('Lets Animate'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FlashAnimation extends StatefulWidget {
  @override
  _FlashAnimationState createState() => _FlashAnimationState();
}

class _FlashAnimationState extends State<FlashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1 * 3.14159,
    ).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: const Icon(
                  Icons.view_in_ar_outlined,
                  size: 100,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class AddButtonAnimation extends StatefulWidget {
//   const AddButtonAnimation({super.key});

//   @override
//   State<AddButtonAnimation> createState() => _AddButtonAnimationState();
// }

// class _AddButtonAnimationState extends State<AddButtonAnimation> {
//   bool isClick = false;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//               child: GestureDetector(
//             onTap: () {
//               setState(() {
//                 isClick = !isClick;
//               });
//             },
//             child: AnimatedContainer(
//                 height: isClick ? 90 : 60,
//                 width: isClick ? 100 : 150,
//                 decoration: BoxDecoration(
//                     color: isClick ? Colors.white : Colors.blueAccent,
//                     border: isClick
//                         ? Border.all(width: 3, color: Colors.green)
//                         : Border.all(color: Colors.transparent),
//                     borderRadius: isClick
//                         ? BorderRadius.circular(50.0)
//                         : const BorderRadius.all(Radius.circular(150))),
//                 duration: const Duration(milliseconds: 100),
//                 child: isClick
//                     ? const Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Icon(
//                             Icons.done,
//                             size: 50,
//                           ),
//                           // Flexible(child: Text("Done")),
//                         ],
//                       )
//                     : const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("Add"),
//                           Icon(Icons.add_shopping_cart_outlined),
//                         ],
//                       )),
//           ))
//         ],
//       ),
//     ));
//   }
// }

// import 'package:flutter/material.dart';

class AddButtonAnimation extends StatefulWidget {
  const AddButtonAnimation({Key? key}) : super(key: key);

  @override
  State<AddButtonAnimation> createState() => _AddButtonAnimationState();
}

class _AddButtonAnimationState extends State<AddButtonAnimation> {
  bool isClick = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isClick = !isClick;
                    isLoading = true;
                  });

                  // Simulate loading for 3 seconds
                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      isLoading = false;
                    });
                  });

                  // Simulate success after loading
                  Future.delayed(const Duration(seconds: 4), () {});
                },
                child: AnimatedContainer(
                  height: isClick ? 90 : 60,
                  width: isClick ? 100 : 150,
                  decoration: BoxDecoration(
                    color: isClick ? Colors.white : Colors.blueAccent,
                    border: isClick
                        ? Border.all(width: 3, color: Colors.green)
                        : Border.all(color: Colors.transparent),
                    borderRadius: isClick
                        ? BorderRadius.circular(50.0)
                        : const BorderRadius.all(Radius.circular(150)),
                  ),
                  duration: const Duration(milliseconds: 100),
                  child: isClick
                      ? isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.done,
                                  size: 50,
                                ),
                              ],
                            )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Add"),
                            Icon(Icons.add_shopping_cart_outlined),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AddButtonAnimation(),
  ));
}
