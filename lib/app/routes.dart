import 'package:flutter/widgets.dart';
import 'package:lbzsunalarm/screens/home/home_controller.dart';
import 'package:lbzsunalarm/screens/home/home_screen.dart';

late GlobalKey<NavigatorState> navigatorKey;

const String pathHome = '/home';
const String pathError = '/error';
const String pathInitialization = '/initialization';
const String pathTerms = '/terms';

class RouteException implements Exception {
  const RouteException(this.message);
  final String message;
}

Route<dynamic> generateRoute(RouteSettings settings) {
  // ignore: unused_local_variable
  final arguments = settings.arguments;

  Widget path;

  switch (settings.name) {
    case pathHome:
    case '/':
      path = HomeScreenLocator(
        controller: HomeScreenController(),
        child: const HomeScreen(),
      );

    default:
      throw const RouteException('Route not found');
  }

  return PageRouteBuilder(
    settings: settings,
    maintainState: false,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 144),
    reverseTransitionDuration: const Duration(milliseconds: 144),
    pageBuilder: (context, animation, secondaryAnimation) => path,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.easeInSine;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
