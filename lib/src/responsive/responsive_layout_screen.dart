import 'package:flutter/material.dart';
import 'package:instagram_clone/src/providers/user_provider.dart';
import 'package:instagram_clone/src/utils/utils.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webLayout;
  final Widget mobileLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobileLayout,
    required this.webLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  addUser() async {
    UserProvider user = Provider.of<UserProvider>(context, listen: false);

    await user.refreshUser();
  }

  @override
  void initState() {
    super.initState();
    addUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webLayout;
        }
        return widget.mobileLayout;
      },
    );
  }
}
