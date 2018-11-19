import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  State createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: FirstSlide(),
    ),
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SecondSlide(),
    ),
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child:
      FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.blue),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildCarousel()),
    );
  }

  Widget _buildCarousel() {
    return Stack(
      children: <Widget>[
        PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
            itemCount: _pages.length),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            color: Colors.grey[800].withOpacity(0.5),
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: DotsIndicator(
                controller: _controller,
                itemCount: _pages.length,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FirstSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Center(
          child: Text('Hello World', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white))
      ),
    );
  }
}

class SecondSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
          child: Text('Welcome to join the conference', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white))
      ),
    );
  }
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  final PageController controller;

  final int itemCount;

  final ValueChanged<int> onPageSelected;

  final Color color;

  static double _dotSize = 8.0;

  static double _maxZoom = 2.0;

  static double _dotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_maxZoom - 1.0) * selected;
    return Container(
      width: _dotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _dotSize * zoom,
            height: _dotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
