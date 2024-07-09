import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HidableAnimate extends StatefulWidget implements PreferredSizeWidget {
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
  State<HidableAnimate> createState() => _HidableAnimateState();

  @override
  Size get preferredSize => preferredWidgetSize;
}

class _HidableAnimateState extends State<HidableAnimate> {
  final ValueNotifier<bool> _isVisible = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.controller.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible.value) _isVisible.value = true;
    } else if (widget.controller.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible.value) _isVisible.value = false;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_scrollListener);
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, bool value, child) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: value ? widget.preferredWidgetSize.height : 0.0,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                widget.child,
              ],
            ));
      },
      valueListenable: _isVisible,
    );
  }
}
