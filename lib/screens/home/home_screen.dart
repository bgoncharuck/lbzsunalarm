import 'package:lbzsunalarm/common/button/primary_big.dart';
import 'package:lbzsunalarm/screens/home/home_controller.dart';
import 'package:lbzsunalarm/ui.dart';

bool adaptiveFormulaIsNotInitialized = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      sctl.init();
    }
  }

  HomeScreenController get sctl => HomeScreenLocator.of(context);

  @override
  Widget build(BuildContext context) {
    if (adaptiveFormulaIsNotInitialized) {
      adaptiveFormulaInitFromBuildContext(context: context);
      adaptiveFormulaIsNotInitialized = false;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => sctl.exit(context),
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              verticalWhiteDoubleSliverSpacer,
              SliverPadding(
                padding: adaptiveInset(left: 16, right: 16),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(sctl.currentLocation, style: s28w500),
                      const Expanded(child: SizedBox.shrink()),
                      if (sctl.selectedTime != null)
                        Text(
                          '${sctl.selectedTime!.hour}:'
                          '${sctl.selectedTime!.minute}',
                          style: s28w500,
                        ),
                    ],
                  ),
                ),
              ),
              verticalWhiteDoubleSliverSpacer,
              SliverPadding(
                padding: adaptiveInset(left: 16, right: 16),
                sliver: SliverToBoxAdapter(
                  child: PrimaryBigButton(
                    text: "Today's Sunset",
                    onPressed: () => setState(sctl.todaySunset),
                  ),
                ),
              ),
              verticalWhiteSliverSpacer,
              SliverPadding(
                padding: adaptiveInset(left: 16, right: 16),
                sliver: SliverToBoxAdapter(
                  child: PrimaryBigButton(
                    text: "Tomorrow's Sunrise",
                    onPressed: () => setState(sctl.tomorrowSunrise),
                  ),
                ),
              ),
              verticalWhiteSliverSpacer,
              SliverPadding(
                padding: adaptiveInset(left: 16, right: 16),
                sliver: SliverToBoxAdapter(
                  child: PrimaryBigButton(
                    text: "Today's Sunrise",
                    onPressed: () => setState(sctl.todaySunrise),
                  ),
                ),
              ),
              verticalWhiteTripleSliverSpacer,
              // SliverPadding(
              //   padding: adaptiveInset(left: 16, right: 16),
              //   sliver: SliverToBoxAdapter(
              //     child: PrimaryBigButton(
              //       text: 'Set Alarm',
              //       onPressed: () => setState(sctl.setAlarm),
              //     ),
              //   ),
              // ),
              // verticalWhiteSliverSpacer,
            ],
          ),
        ),
      ),
    );
  }
}
