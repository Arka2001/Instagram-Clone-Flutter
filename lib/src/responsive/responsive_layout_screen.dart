import 'package:flutter/material.dart';
import 'package:instagram_clone/src/utils/utils.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webLayout;
  final Widget mobileLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobileLayout,
    required this.webLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webLayout;
        }
        return mobileLayout;
      },
    );
  }
}
