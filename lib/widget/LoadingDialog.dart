import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  bool inAsyncCall = false;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  late Widget child;

  LoadingDialog({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    Widget layOutProgressIndicator;
    if (offset?.isFinite == true) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset?.dx,
        top: offset?.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: dismissible, color: color),
        ),
        layOutProgressIndicator,
      ],
    );
  }
}
