import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletsScaffold;
  final Widget desktopScaffold;
  const ResponsiveLayout(
      {super.key,
      required this.mobileScaffold,
      required this.tabletsScaffold,
      required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileScaffold;
      } else if (constraints.minWidth > 500 && constraints.maxWidth < 1100) {
        return tabletsScaffold;
      } else {
        return desktopScaffold;
      }
    }));
  }
}
