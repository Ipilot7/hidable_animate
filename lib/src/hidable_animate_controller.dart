import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

extension HidableAnimateControllerExt on ScrollController {
  static final hidableControllers = <int, HidableAnimateController>{};

  HidableAnimateController hidableAnimate(int hashCode) {
    if (hidableControllers.containsKey(hashCode)) {
      return hidableControllers[hashCode]!;
    }

    return hidableControllers[hashCode] = HidableAnimateController(
      scrollController: this,
    );
  }
}

class HidableAnimateController {
  ScrollController scrollController;

  HidableAnimateController({
    required this.scrollController,
  }) {
    scrollController.addListener(() => updateVisibility());
  }

  final visibilityNotifier = ValueNotifier<bool>(true);

  void updateVisibility() {
    final position = scrollController.position;
    if (position.userScrollDirection == ScrollDirection.reverse) {
      if (visibilityNotifier.value) visibilityNotifier.value = false;
    } else if (position.userScrollDirection == ScrollDirection.forward) {
      if (!visibilityNotifier.value) visibilityNotifier.value = true;
    }
  }

  void close() => visibilityNotifier.dispose();
}
