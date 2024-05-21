import 'package:flutter/material.dart';

class HoverableCard extends StatefulWidget {
  final Widget child;

  HoverableCard({required this.child});

  @override
  _HoverableCardState createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  static bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onMouseEnter(),
      onExit: (_) => _onMouseExit(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform:
            isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        child: widget.child,
      ),
    );
  }

  void _onMouseEnter() {
    setState(() {
      isHovered = true;
    });
  }

  void _onMouseExit() {
    setState(() {
      isHovered = false;
    });
  }
}
