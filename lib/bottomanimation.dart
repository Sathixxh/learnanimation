
import 'package:flutter/material.dart';

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
      }

       else if (status == AnimationStatus.dismissed) {
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
