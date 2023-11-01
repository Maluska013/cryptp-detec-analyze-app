import 'dart:ui';

class Palette {
  Palette._();
  static const GrayScale grayTheme = GrayScale._();
  static const BlueScale blueTheme = BlueScale._();
  static const PurpleScale purpleTheme = PurpleScale._();
  static const RedScale redTheme = RedScale._();
  static const GreenScale greenTheme = GreenScale._();
  static const YellowScale yellowTheme = YellowScale._();
}

class GrayScale {
  const GrayScale._();

  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);
  Color get gray300 => const Color(0xFF3E434E);
  Color get gray400 => const Color(0xFF5D606F);
  Color get gray500 => const Color(0xFF9B9EAB);
  Color get gray600 => const Color(0xFFB0B2B6);
  Color get gray700 => const Color(0xFFE9E9ED);
  Color get gray800 => const Color(0xFFFCFCFC);
}

class BlueScale {
  const BlueScale._();

  Color get main => const Color(0xFF1458F5);
  Color get blue200 => const Color(0xFF073AB0);
  Color get blue300 => const Color(0xFF779EF9);
  Color get blue400 => const Color(0xFFC4D5FD);
  Color get blue500 => const Color(0xFFEAF0FE);
}

class PurpleScale {
  const PurpleScale._();

  Color get main => const Color(0xFF6D67D9);
  Color get purple200 => const Color(0xFF4C4898);
  Color get purple300 => const Color(0xFF8681DF);
  Color get purple400 => const Color(0xFFAAA7E9);
  Color get purple500 => const Color(0xFFF0F0FB);
}

class RedScale {
  const RedScale._();

  Color get main => const Color(0xFFF1450F);
  Color get red200 => const Color(0xFFA9300B);
  Color get red300 => const Color(0xFFF36538);
  Color get red400 => const Color(0xFFF79374);
  Color get red500 => const Color(0xFFFEECE7);
}

class GreenScale {
  const GreenScale._();

  Color get main => const Color(0xFF3ABD7C);
  Color get green200 => const Color(0xFF298457);
  Color get green300 => const Color(0xFF5BC892);
  Color get green400 => const Color(0xFF8DD9B3);
  Color get green500 => const Color(0xFFEBF8F2);
}

class YellowScale {
  const YellowScale._();

  Color get main => const Color(0xFFFFB237);
  Color get yellow200 => const Color(0xFFB37D27);
  Color get yellow300 => const Color(0xFFFFBF59);
  Color get yellow400 => const Color(0xFFFFD28B);
  Color get yellow500 => const Color(0xFFFFF7EB);
}
