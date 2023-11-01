import 'package:crypto_detect/design/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EmptyStateHistory extends StatelessWidget {
  const EmptyStateHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: Palette.grayTheme.gray700),
          ),
          child: Icon(
            PhosphorIconsLight.drop,
            size: 64,
            color: Palette.grayTheme.gray600,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 11.0, left: 58, right: 58),
          child: Text(
            'Aún no has tomado ninguna muestra',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }
}
