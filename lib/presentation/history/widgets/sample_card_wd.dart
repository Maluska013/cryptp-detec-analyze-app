import 'dart:typed_data';

import 'package:crypto_detect/design/theme/colors.dart';
import 'package:crypto_detect/design/theme/text.dart';
import 'package:crypto_detect/presentation/entities/sample.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SampleCard extends StatelessWidget {
  final Sample sample;

  const SampleCard({
    super.key,
    required this.sample,
  });

  @override
  Widget build(BuildContext context) {
    final date = Jiffy.parseFromDateTime(sample.sampleDate).format(pattern: '[Tomada el] do, MMM yyyy');
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grayTheme.gray700),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SampleImage(
            image: sample.image,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sample.title, style: AppTextTheme.subtitle),
              Text(date, style: AppTextTheme.bodyText1),
              const SizedBox(height: 12.0),
              ResultSampleWd(
                isPresentMicro: sample.presentMicroorganism,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SampleImage extends StatelessWidget {
  final Uint8List? image;

  const SampleImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 89,
      height: 89,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Visibility(
          visible: image != null,
          replacement: Image.asset(
            'assets/sample.png',
            fit: BoxFit.cover,
          ),
          child: Visibility(
            visible: image != null,
            replacement: Image.asset('assets/sample.png'),
            child: Image.memory(
              image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
// child: Image.file(
//                         File(widget.image.path),
//                         fit: BoxFit.cover,
//                       ),

class ResultSampleWd extends StatelessWidget {
  final bool isPresentMicro;

  const ResultSampleWd({super.key, required this.isPresentMicro});

  @override
  Widget build(BuildContext context) {
    final Icon resultIcon = Icon(
      isPresentMicro ? PhosphorIconsLight.warning : PhosphorIconsLight.check,
      color: isPresentMicro ? Palette.redTheme.red200 : Palette.grayTheme.gray300,
      size: 16.0,
    );
    final Text resultText = Text(
      isPresentMicro ? 'Contiene bacterias' : 'No contiene bacterias',
      style: TextStyle(color: isPresentMicro ? Palette.redTheme.red200 : Palette.grayTheme.gray400, fontSize: 12.0),
    );
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: isPresentMicro ? Palette.redTheme.red500 : Palette.grayTheme.gray700,
        ),
        color: isPresentMicro ? Palette.redTheme.red500 : Palette.grayTheme.gray800,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          resultIcon,
          const SizedBox(
            width: 4.0,
          ),
          resultText,
        ],
      ),
    );
  }
}
