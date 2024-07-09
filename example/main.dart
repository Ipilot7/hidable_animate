import 'package:flutter/material.dart';
import 'package:hidable_animate/hidable_animate.dart';

class ScrollableBottomNavBar extends StatefulWidget {
  const ScrollableBottomNavBar({super.key});

  @override
  State<ScrollableBottomNavBar> createState() => _ScrollableBottomNavBarState();
}

class _ScrollableBottomNavBarState extends State<ScrollableBottomNavBar> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HidableAnimate Widget')),
      body: ListView.builder(
        controller: scrollController,
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
      bottomNavigationBar: HidableAnimate(
        controller: scrollController,
        child: Wrap(
          children: <Widget>[
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: ScrollableBottomNavBar()));
