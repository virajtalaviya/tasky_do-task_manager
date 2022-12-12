import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // value: SystemUiOverlayStyle.light,
      value: SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
