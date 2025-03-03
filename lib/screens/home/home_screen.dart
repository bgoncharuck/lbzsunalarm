import 'package:lbzsunalarm/screens/home/home_controller.dart';
import 'package:lbzsunalarm/ui.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => sctl.exit(context),
      child: const SafeArea(
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              verticalWhiteSliverSpacer,
              SliverToBoxAdapter(child: Text('Home')),
              verticalWhiteSliverSpacer,
            ],
          ),
        ),
      ),
    );
  }
}
