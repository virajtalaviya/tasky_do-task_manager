import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
