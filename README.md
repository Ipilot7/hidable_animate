
To start using `HidableAnimate` widget, we have to create a `ScrollController`. inctance before.
```dart
final ScrollController scrollController = ScrollController();
```
As case of usage, we should have one scrollable widget (SingleChildScrollView, ListView etc)
and one static located widget (`AppBar`, `BottomNavigationBar`, `FloatingActionButton` and etc) which would be wrapped with `HidableAnimate` widget.

So, `scrollController` which we created before must be given to each one (scrollable widget and static located hidable_animate widget).

#### Scrollable widget
```dart
ListView.separated(
  // General scroll controller which makes bridge between
  // This ListView and HidableAnimate widget.
  controller: scrollController,
  itemCount: colors.length,
  itemBuilder: (_, i) => Container(
     height: 50,
     color: colors[i].withOpacity(.6),
  ),
  separatorBuilder: (_, __) => const SizedBox(height: 10),
),
```

#### Static located hidable_animate widget
```dart
HidableAnimate(
  controller: scrollController,
  child: BottomNavigationBar(...),
),
```

**That is the common usage of hidable_animate, and also you can find full code implmenetation of hidable_animate at** [official example page](https://github.com/Ipilot7/hidable_animate/example/main.dart).
