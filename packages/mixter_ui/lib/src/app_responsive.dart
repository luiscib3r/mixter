import 'package:flutter/cupertino.dart';

class AppResponsive extends StatelessWidget {
  const AppResponsive({
    super.key,
    this.mobileBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
  });

  static const mobile = 480;
  static const tablet = 768;

  final WidgetBuilder? mobileBuilder;
  final WidgetBuilder? tabletBuilder;
  final WidgetBuilder? desktopBuilder;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobile;

  static T value<T>(
    BuildContext context,
    T defaultValue, {
    T? mobileValue,
    T? tabletValue,
    T? desktopValue,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width <= mobile) {
      return mobileValue ?? defaultValue;
    } else if (width <= tablet) {
      return tabletValue ?? defaultValue;
    } else {
      return desktopValue ?? defaultValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width <= mobile) {
      return mobileBuilder?.call(context) ?? const SizedBox();
    } else if (width <= tablet) {
      return tabletBuilder?.call(context) ?? const SizedBox();
    } else {
      return desktopBuilder?.call(context) ?? const SizedBox();
    }
  }
}
