import 'package:mixter_ui/mixter_ui.dart';

extension BuildContextX on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}
