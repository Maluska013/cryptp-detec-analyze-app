import 'package:auto_route/auto_route.dart';
import 'package:crypto_detect/design/theme/colors.dart';
import 'package:crypto_detect/design/theme/components/button.dart';
import 'package:crypto_detect/design/theme/text.dart';
import 'package:crypto_detect/presentation/entities/sample.dart';
import 'package:crypto_detect/presentation/history/sample_detail/sample_detail_vm.dart';
import 'package:crypto_detect/presentation/mvvm/view_state.abs.dart';
import 'package:crypto_detect/presentation/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class SampleDetailScreen extends StatefulWidget {
  final Sample sample;

  const SampleDetailScreen({
    Key? key,
    required this.sample,
  }) : super(key: key);

  @override
  State<SampleDetailScreen> createState() => _SampleDetailScreenState();
}

class _SampleDetailScreenState extends ViewState<SampleDetailScreen, SampleDetailViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.initSample(widget.sample);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SampleDetailState>(
      stream: viewModel.state,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.sample.title),
          ),
          body: Stack(
            children: [
              SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  child: Image.memory(
                    widget.sample.image,
                    fit: BoxFit.cover,
                  )),
              DraggableScrollableSheet(
                maxChildSize: 0.65,
                initialChildSize: 0.65,
                builder: (context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _SampleTitleTile(
                            title: widget.sample.title,
                            state: widget.sample.presentMicroorganism,
                            onEditPressed: viewModel.onEditTap,
                          ),
                          const Divider(height: 0),
                          _SampleDetailsTile(results: widget.sample.result),
                          const Divider(height: 0),
                          _SampleObservationsFiled(
                            inputObservation: viewModel.observations,
                          ),
                          const Divider(height: 0),
                          const _SampleDescriptionTile(),
                          const Divider(height: 0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppButton(
                callback: () {
                  context.router.replaceAll([HomeRoute(tabIndex: 1)]);
                  viewModel.onSaveSample(widget.sample);
                },
                text: 'Guardar muestra',
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SampleTitleTile extends StatelessWidget {
  final String title;
  final bool state;
  final VoidCallback onEditPressed;

  const _SampleTitleTile({
    required this.title,
    required this.state,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = state ? Palette.redTheme.red200 : Palette.greenTheme.green200;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextTheme.title,
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(
                      state
                          ? PhosphorIcons.warning(PhosphorIconsStyle.light)
                          : PhosphorIcons.checkCircle(PhosphorIconsStyle.light),
                      color: color,
                    ),
                    const SizedBox(width: 4.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Esta muestra ',
                            style: AppTextTheme.bodyText1.copyWith(
                              color: color,
                            ),
                          ),
                          TextSpan(
                            text: state ? 'contiene parásitos' : 'No contiene parásito',
                            style: AppTextTheme.subtitle.copyWith(
                              color: color,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onEditPressed,
            child: Text(
              'Editar',
              style: AppTextTheme.bodyText2.copyWith(
                decoration: TextDecoration.underline,
                color: Palette.grayTheme.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SampleDetailsTile extends StatelessWidget {
  final String results;

  const _SampleDetailsTile({
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detalles Generales',
            style: AppTextTheme.subtitle,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Icon(
                PhosphorIcons.bugBeetle(PhosphorIconsStyle.light),
                size: 16.0,
              ),
              const SizedBox(width: 4.0),
              Text(
                'Parásito detectado',
                style: AppTextTheme.subtitle.copyWith(
                  color: Palette.grayTheme.gray400,
                ),
              ),
              const Spacer(),
              const Text('Cryptosporidium spp.'),
            ],
          ),
          Row(
            children: [
              Icon(
                PhosphorIcons.circlesThree(PhosphorIconsStyle.light),
                size: 16.0,
              ),
              const SizedBox(width: 4.0),
              Text(
                'Cantidad',
                style: AppTextTheme.subtitle.copyWith(
                  color: Palette.grayTheme.gray400,
                ),
              ),
              const Spacer(),
              Text(results),
            ],
          )
        ],
      ),
    );
  }
}

class _SampleObservationsFiled extends StatelessWidget {
  final ValueChanged<String> inputObservation;

  const _SampleObservationsFiled({required this.inputObservation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Observaciones',
            style: AppTextTheme.subtitle,
          ),
          const SizedBox(height: 16.0),
          TextField(
            minLines: 3,
            maxLines: 5,
            onChanged: inputObservation,
            decoration: InputDecoration(
              hintText: 'Escribe detalles de la muestra, como la ubicación, las condiciones, etc.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SampleDescriptionTile extends StatelessWidget {
  const _SampleDescriptionTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descripción y recomendaciones',
            style: AppTextTheme.subtitle,
          ),
          const SizedBox(height: 16.0),
          const _SampleRecommendationTile(),
          const SizedBox(height: 16.0),
          const _SampleRecommendationTile(),
        ],
      ),
    );
  }
}

class _SampleRecommendationTile extends StatelessWidget {
  const _SampleRecommendationTile();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(PhosphorIcons.circleDashed(PhosphorIconsStyle.light)),
            const SizedBox(width: 8.0),
            Text(
              'Recomendación 1',
              style: AppTextTheme.subtitle.copyWith(
                color: Palette.grayTheme.gray400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: AppTextTheme.bodyText1.copyWith(
            color: Palette.grayTheme.gray400,
          ),
        ),
      ],
    );
  }
}
