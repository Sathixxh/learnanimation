import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = HeroItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero"),
      ),
      body: ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroDetails(items: item),
                ),
              );
            },
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            leading: Hero(
              tag: controller.items[index].image,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(item.image),
              ),
            ),
          );
        },
      ),
    );
  }
}



class HeroDetails extends StatelessWidget {
  final HeroInfo items;
  const HeroDetails({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.title),
      ),
      body: Center(
        child: Hero(
          tag: items.image,
          transitionOnUserGestures: true,
          flightShuttleBuilder: (BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext) {
            final Widget toHero = toHeroContext.widget;
            return RotationTransition(
              turns: animation,
              child: toHero,
            );
          },
          placeholderBuilder: (BuildContext context, Size size, Widget child) {
            return SizedBox(
              width: size.width,
              height: size.height,
              child: Text(""),
            );
          },
          child: CircleAvatar(radius: 200, child: Image.asset(items.image)),
        ),
      ),
    );
  }
}

class HeroInfo {
  final String title;
  final String subtitle;
  final String image;

  HeroInfo({required this.title, required this.subtitle, required this.image});
}

class HeroItems {
  List<HeroInfo> items = [
    HeroInfo(
        title: "Sathixh",
        subtitle: "sqathixh@gmail.com",
        image: "assets/image2.png"),
    HeroInfo(
        title: "Srhtrji",
        subtitle: "sqathixh@gmail.com",
        image: "assets/image1.png"),
  ];
}
