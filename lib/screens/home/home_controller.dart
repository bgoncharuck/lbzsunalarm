import 'package:lbzsunalarm/app/widgets_binding.dart';
import 'package:lbzsunalarm/logic.dart';

class HomeScreenController extends ScreenController {
  HomeScreenController();

  void init() {
    if (super.initOnce) {
      return;
    }
    widgetsBinding.removeSplashScreen();
  }

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
