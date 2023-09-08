//=2.0
import 'package:flutter/material.dart';
import 'package:fl_example/pages/animation/basics/01_animation_container.dart';
import 'package:fl_example/pages/animation/basics/02_page_route_builder.dart';
import 'package:fl_example/pages/animation/basics/03_animation_controller.dart';
import 'package:fl_example/pages/animation/basics/04_tweens.dart';
import 'package:fl_example/pages/animation/basics/05_animated_builder.dart';
import 'package:fl_example/pages/animation/basics/06_custom_tween.dart';
import 'package:fl_example/pages/animation/basics/07_tween_sequence.dart';
import 'package:fl_example/pages/animation/basics/08_fade_transition.dart';
import 'package:fl_example/pages/animation/demos/animation_demo.dart';
import 'package:fl_example/pages/animation/demos/shopping_cart/shopping_cart.dart';
import 'package:fl_example/pages/animation/demos/staggered_animation_demo.dart';
import 'package:fl_example/pages/animation/misc/animated_positioned.dart';
import 'package:fl_example/pages/animation/misc/animated_switcher.dart';
import 'package:fl_example/pages/animation/misc/animted_list.dart';
import 'package:fl_example/pages/animation/misc/card_swipe.dart';
import 'package:fl_example/pages/animation/misc/carousel.dart';
import 'package:fl_example/pages/animation/misc/curved_animation.dart';
import 'package:fl_example/pages/animation/misc/expand_card.dart';
import 'package:fl_example/pages/animation/misc/focus_images.dart';
import 'package:fl_example/pages/animation/demos/gif_animation.dart';
import 'package:fl_example/pages/animation/misc/hero_animation.dart';
import 'package:fl_example/pages/animation/demos/json_animation.dart';
import 'package:fl_example/pages/animation/misc/physics_card_drag.dart';
import 'package:fl_example/pages/animation/misc/repeating_animation.dart';

import 'demos/custom_painter_demo.dart';
import 'demos/text_style_animation.dart';

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({
    this.name,
    this.route,
    this.builder,
  });
}

final String rootRouteName = '/';

final basicDemos = [
  Demo(
    name: 'AnimatedContainer',
    route: AnimatedContainerDemo.routeName,
    builder: (BuildContext context) => AnimatedContainerDemo(),
  ),
  Demo(
    name: 'PageRouteBuilder',
    route: PageRouteBuilderDemo.routeName,
    builder: (BuildContext context) => PageRouteBuilderDemo(),
  ),
  Demo(
    name: 'AnimationController',
    route: AnimationControllerDemo.routeName,
    builder: (BuildContext context) => AnimationControllerDemo(),
  ),
  Demo(
    name: 'Tween',
    route: TweenDemo.routeName,
    builder: (BuildContext context) => TweenDemo(),
  ),
  Demo(
    name: 'AnimatedBuilder',
    route: AnimatedBuilderDemo.routeName,
    builder: (BuildContext context) => AnimatedBuilderDemo(),
  ),
  Demo(
    name: 'CustomTween',
    route: CustomTweenDemo.routeName,
    builder: (BuildContext context) => CustomTweenDemo(),
  ),
  Demo(
    name: 'TweenSequence',
    route: TweenSequenceDemo.routeName,
    builder: (BuildContext context) => TweenSequenceDemo(),
  ),
  Demo(
    name: 'FadeTransition',
    route: FadeTransitionDemo.routeName,
    builder: (BuildContext context) => FadeTransitionDemo(),
  ),
];

final miscDemos = [
  Demo(
    name: 'AnimatedList',
    route: AnimatedListDemo.routeName,
    builder: (BuildContext context) => AnimatedListDemo(),
  ),
  Demo(
    name: 'AnimatedPositioned',
    route: AnimatedPositionedDemo.routeName,
    builder: (BuildContext context) => AnimatedPositionedDemo(),
  ),
  Demo(
    name: 'AnimatedSwitcher',
    route: AnimatedSwitcherDemo.routeName,
    builder: (BuildContext context) => AnimatedSwitcherDemo(),
  ),
  Demo(
    name: 'CardSwipe',
    route: CardSwipeDemo.routeName,
    builder: (BuildContext context) => CardSwipeDemo(),
  ),
  Demo(
    name: 'Carousel',
    route: CarouselDemo.routeName,
    builder: (BuildContext context) => CarouselDemo(),
  ),
  Demo(
    name: 'RepeatingAnimation',
    route: RepeatingAnimationDemo.routeName,
    builder: (BuildContext context) => RepeatingAnimationDemo(),
  ),
  Demo(
    name: 'PhysicsCardDrag',
    route: PhysicsCardDragDemo.routeName,
    builder: (BuildContext context) => PhysicsCardDragDemo(),
  ),
  Demo(
    name: 'ExpandCard',
    route: ExpandCardDemo.routeName,
    builder: (BuildContext context) => ExpandCardDemo(),
  ),
  Demo(
    name: 'FocusImages',
    route: FocusImagesDemo.routeName,
    builder: (BuildContext context) => FocusImagesDemo(),
  ),
  Demo(
    name: 'HeroAnimation',
    route: HeroAnimationDemo.routeName,
    builder: (BuildContext context) => HeroAnimationDemo(),
  ),
  Demo(
    name: 'CurvedAnimation',
    route: CurvedAnimationDemo.routeName,
    builder: (BuildContext context) => CurvedAnimationDemo(),
  ),
];

final demos = [
  Demo(
    name: 'AnimationDemo',
    route: AnimationDemo.routeName,
    builder: (BuildContext context) => AnimationDemo(),
  ),
  Demo(
    name: 'TextStyleDemo',
    route: TextStyleDemo.routeName,
    builder: (BuildContext context) => TextStyleDemo(),
  ),
  Demo(
    name: 'GIFAnimation',
    route: GIFAnimationDemo.routeName,
    builder: (BuildContext context) => GIFAnimationDemo(),
  ),
  Demo(
    name: 'JsonAnimation',
    route: JsonAnimationDemo.routeName,
    builder: (BuildContext context) => JsonAnimationDemo(),
  ),
  Demo(
    name: 'ShoppingCart',
    route: ShoppingCartDemo.routeName,
    builder: (BuildContext context) => ShoppingCartDemo(),
  ),
  Demo(
    name: 'CustomPainter',
    route: CustomPainterDemo.routeName,
    builder: (BuildContext context) => CustomPainterDemo(),
  ),
  Demo(
    name: 'StaggeredAnimation',
    route: StaggeredAnimationDemo.routeName,
    builder: (BuildContext context) => StaggeredAnimationDemo(),
  ),
];
final basicDemoRoutes =
    Map.fromEntries(basicDemos.map((e) => MapEntry(e.route, e.builder)));

final miscDemoRoutes =
    Map.fromEntries(miscDemos.map((e) => MapEntry(e.route, e.builder)));

final demosRoutes =
    Map.fromEntries(demos.map((e) => MapEntry(e.route, e.builder)));

final allDemos = [
  ...demos,
  ...basicDemos,
  ...miscDemos,
];

final allRoutes = <String, WidgetBuilder>{
  rootRouteName: (BuildContext context) => AnimationDemos(),
  ...demosRoutes,
  ...basicDemoRoutes,
  ...miscDemoRoutes,
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: allRoutes,
      initialRoute: rootRouteName,
    );
  }
}

class AnimationDemos extends StatefulWidget {
  AnimationDemos({Key key}) : super(key: key);
  @override
  _AnimationDemosState createState() => _AnimationDemosState();
}

class _AnimationDemosState extends State<AnimationDemos> {
  List<Widget> listChildren() {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return [
      ListTile(
          title: Text('Demos', style: headerStyle), tileColor: Colors.orange),
      ...demos.map((e) => ListTile(
          leading: Text(e.name),
          onTap: () {
            Navigator.of(context).pushNamed(e.route);
          })),
      ListTile(
          title: Text('Basics', style: headerStyle), tileColor: Colors.orange),
      ...basicDemos.map((e) => ListTile(
          leading: Text(e.name),
          onTap: () {
            Navigator.of(context).pushNamed(e.route);
          })),
      ListTile(
          title: Text('Misc', style: headerStyle), tileColor: Colors.orange),
      ...miscDemos.map((e) => ListTile(
          leading: Text(e.name),
          onTap: () {
            Navigator.of(context).pushNamed(e.route);
          })),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation Demos'),
        ),
        body: ListView(
          children: listChildren(),
        ));
  }
}
