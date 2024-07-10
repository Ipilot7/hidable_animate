import 'package:flutter/material.dart';
import 'package:hidable_animate/src/hidable_animate_controller.dart';

class HidableAnimate extends StatelessWidget implements PreferredSizeWidget {
  const HidableAnimate({
    super.key,
    required this.controller,
    required this.child,
    this.preferredWidgetSize = const Size.fromHeight(56),
  });

  final ScrollController controller;
  final Widget child;
  final Size preferredWidgetSize;

  @override
  Widget build(BuildContext context) {
    final hidable = controller.hidableAnimate(hashCode);
    return ValueListenableBuilder(
      builder: (context, bool value, item) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: value ? preferredWidgetSize.height : 0.0,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [child],
            ));
      },
      valueListenable: hidable.visibilityNotifier,
    );
  }

  @override
  Size get preferredSize => preferredWidgetSize;
}
