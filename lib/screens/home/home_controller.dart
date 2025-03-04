import 'package:lbzsunalarm/app/widgets_binding.dart';
import 'package:lbzsunalarm/logic.dart';
import 'package:lbzsunalarm/use_case/time/create_daylight_calc.dart';
import 'package:lbzsunalarm/use_case/time/create_locations.dart';

class HomeScreenController extends ScreenController {
  HomeScreenController();

  final Map<String, DaylightCalculator> dlc = {};

  void init() {
    if (super.initOnce) {
      return;
    }
    widgetsBinding.removeSplashScreen();
  }

  Future<String> addLocation(String location) async {
    if (dlc.containsKey(location)) {
      return location;
    }

    final locations = await const CreateSunsetLocations().execute(
      params: location,
    );
    if (locations.isEmpty) {
      return 'No Location Found or No Internet';
    }

    final dayLightCalc = await const CreateDaylightCalculator().execute(
      params: locations,
    );
    if (dayLightCalc == null) {
      return 'No Location Found or No Internet';
    }

    dlc[location] = dayLightCalc;
    return location;
  }

  Future<void> todaySunset() async {
    // final today = DateTime.now();
  }

  Future<void> tomorrowSunrise() async {
    // final tomorrow = DateTime.now().add(const Duration(days: 1));
  }

  Future<void> alarm() async {}

  void exit(BuildContext context) {}
}

class HomeScreenLocator extends InheritedWidget {
  const HomeScreenLocator({
    required this.controller,
    required super.child,
    super.key,
  });

  final HomeScreenController controller;

  static HomeScreenController of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<HomeScreenLocator>();
    if (widget == null) {
      throw FlutterError('HomeScreenLocator not found in context.');
    }
    return widget.controller;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
