import 'package:google_fonts/google_fonts.dart';
import 'package:mixter_ui/mixter_ui.dart';

part 'colors.dart';
part 'texts.dart';

const _base = CupertinoThemeData(
  brightness: Brightness.dark,
);

final appTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  applyThemeToAll: true,
  scaffoldBackgroundColor: AppColors.scaffold,
  primaryColor: AppColors.primary,
  textTheme: CupertinoTextThemeData(
    primaryColor: AppColors.primary,
    textStyle: GoogleFonts.ubuntu(
      textStyle: _base.textTheme.textStyle,
    ),
  ),
);
