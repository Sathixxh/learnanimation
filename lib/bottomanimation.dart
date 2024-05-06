import 'package:flutter/material.dart';

import 'dart:math' as math;

class BottomAnimation extends StatefulWidget {
  BottomAnimation({super.key});

  @override
  State<BottomAnimation> createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    // for reverse  as well
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat(reverse: true);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(from: 0.1);
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, index) {
              return Container(
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
        
                  // borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 46, 49, 211),
                    Colors.white,
                    Colors.green,
                  ], stops: [
                    0.0,
                    controller.value,
                    1.0,
                  ]),
                ),
                child: Container(
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 207, 232, 236),
                    shape: BoxShape.circle,
                  ),
        
                  child: Container(
                    height: 190,
                  ),
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(onPressed: () {}, child: Icon(Icons.abc_outlined)),
            AnimatedBuilder(
              animation: controller,
              builder: (context, index) {
                return Container(
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 46, 49, 211),
                      Colors.white,
                      Colors.blue,
                    ], stops: [
                      0.0,
                      controller.value,
                      1.0,
                    ]),
                  ),
                  child: Card(
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 100,
                        child: BottomNavigationBar(
                          useLegacyColorScheme: false,
                          items: const <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.search),
                              label: 'Search',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.person),
                              label: 'Profile',
                            ),
                          ],
                          currentIndex: _selectedIndex,
                          selectedItemColor: Colors.blue,
                          onTap: _onItemTapped,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ]),
        ));
  }
}

// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';

class StaggeredList extends StatefulWidget {
  @override
  _StaggeredListState createState() => _StaggeredListState();
}

class _StaggeredListState extends State<StaggeredList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered List'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final delay = (index * 0.1)
              .clamp(0.0, 1.0); // Create a delay based on index (0.0 to 1.0)
          return AnimatedBuilder(
            animation: _controller,
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blueGrey,
              child: Text('Item $index'),
            ),
            builder: (context, child) => Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value.clamp(0.0, 1.0),
                child: FractionalTranslation(
                  translation: Offset(0.0, delay), // Apply delay based on index
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}



class CircularLoadingAnimation extends StatefulWidget {
  CircularLoadingAnimation({Key? key}) : super(key: key);

  @override
  _CircularLoadingAnimationState createState() =>
      _CircularLoadingAnimationState();
}

class _CircularLoadingAnimationState extends State<CircularLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  tileMode: TileMode.clamp,
                  colors: [
                    Color.fromARGB(255, 46, 49, 211),
                    Colors.white,
                    Colors.green,
                  ],
                  stops: [
                    0.0,
                    controller.value,
                    1.0,
                  ],
                  startAngle: 0,
                  endAngle: math.pi * 2 * controller.value,
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    const Color.fromARGB(0, 240, 8, 8),
                  ),
                  strokeWidth: 1,
             
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Your bottom navigation bar here
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CircularLoadingAnimation(),
  ));
}
