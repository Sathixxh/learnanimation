import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 0.5;
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SecondPage();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(1.0, 0.0), end: Offset.zero)
                              
                          .animate(animation),
                      child: child,
                    );
                  },
                )
                // PageRouteBuilder(
                //   transitionDuration: Duration(milliseconds: 500),
                //   pageBuilder: (_, __, ___) => SecondPage(),
                //   transitionsBuilder: (_, animation, __, child) {
                //     return SlideTransition(
                //       position: Tween<Offset>(
                //         begin: Offset(1.0, 0.0),
                //         end: Offset.zero,
                //       ).animate(animation),
                //       child: child,
                //     );
                //   },
                // ),
                );
          },
          child: Text('Go to Second Page'),



        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Row(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ),
          VerticalDivider(
            thickness: 2,
            // color: Colors.amber,
          ),
 Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ),

        ],
      ),
    );
  }
}
