//
// Copyright 2021-2023 present Insolite. All rights reserved.
// Use of this source code is governed by Apache 2.0 license
// that can be found in the LICENSE file.
//

import 'package:flutter/material.dart';
import 'package:hidable_animate/hidable_animate.dart';

// Just a simple testing utility widget.
// Used to test, hidable_animate widget and hidable_animate controller.
class TestWidget extends StatelessWidget {
  final bool enableOpacityAnimation;
  final ScrollController scrollController;
  final bool wAppBar;

  const TestWidget({
    super.key,
    required this.scrollController,
    this.enableOpacityAnimation = true,
    this.wAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: !wAppBar
            ? null
            : HidableAnimate(controller: scrollController, child: AppBar()),
        body: ListView(
          controller: scrollController,
          children: List.generate(30, (index) => Text('Text $index')).toList(),
        ),
        bottomNavigationBar: wAppBar
            ? null
            : HidableAnimate(
                controller: scrollController,
                child: Container(
                  height: kBottomNavigationBarHeight,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
