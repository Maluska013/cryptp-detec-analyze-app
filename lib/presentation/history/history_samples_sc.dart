import 'package:auto_route/auto_route.dart';
import 'package:crypto_detect/design/theme/components/button.dart';
import 'package:crypto_detect/presentation/history/history_samples_vm.dart';
import 'package:crypto_detect/presentation/history/widgets/empty_state_wd.dart';
import 'package:crypto_detect/presentation/history/widgets/sample_card_wd.dart';
import 'package:crypto_detect/presentation/mvvm/view_state.abs.dart';
import 'package:crypto_detect/presentation/route/app_router.dart';
import 'package:flutter/material.dart';

class HistorySamples extends StatefulWidget {
  final VoidCallback onAddSample;

  const HistorySamples({
    super.key,
    required this.onAddSample,
  });

  @override
  State<HistorySamples> createState() => _HistorySamplesState();
}

class _HistorySamplesState extends ViewState<HistorySamples, HistorySampleViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HistorySamplesState>(
      stream: viewModel.state,
      builder: (BuildContext context, AsyncSnapshot<HistorySamplesState> snapshot) {
        final state = snapshot.data ?? const HistorySamplesState();
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.only(top: 96),
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: state.samples.isNotEmpty,
                replacement: const EmptyStateHistory(),
                child: Column(
                  children: state.samples.map((sample) {
                    return Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.router.push(
                              SampleDetailRoute(sample: sample),
                            );
                          },
                          borderRadius: BorderRadius.circular(8.0),
                          child: SampleCard(
                            sample: sample,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppButton(
                callback: widget.onAddSample,
                text: 'Tomar muestra',
              ),
            ),
          ),
        );
      },
    );
  }
} /*
final date = Jiffy.parseFromDateTime(sample.sampleDate)
    .format(pattern: '[Tomada el] do, MMM yyyy');
*/
