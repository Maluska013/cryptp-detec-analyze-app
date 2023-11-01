import 'package:crypto_detect/design/theme/colors.dart';
import 'package:crypto_detect/design/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final bool dark;

  const AppButton({
    Key? key,
    required this.callback,
    required this.text,
    this.dark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        foregroundColor: Palette.grayTheme.black,
        backgroundColor:
            dark ? Palette.grayTheme.black : Palette.grayTheme.white,
        shape: RoundedRectangleBorder(
          side: dark
              ? BorderSide(color: Palette.grayTheme.white)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      onPressed: callback,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: context.theme.typo.button.copyWith(
              color: dark ? Palette.grayTheme.white : Palette.grayTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
