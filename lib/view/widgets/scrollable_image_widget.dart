import 'package:flutter/material.dart';

class ScrollableImage extends StatefulWidget {
  final List<Widget> children;

  const ScrollableImage({super.key, required this.children});

  @override
  _ScrollableImageState createState() => _ScrollableImageState();
}

class _ScrollableImageState extends State<ScrollableImage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 110,
          height: 110,
          child: PageView(
            controller: _controller,
            children: widget.children,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.children.length, (index) {
            return Container(
              width: 7.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.5),
              ),
            );
          }),
        ),
      ],
    );
  }
}
