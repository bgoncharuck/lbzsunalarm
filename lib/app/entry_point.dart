import 'package:flutter/cupertino.dart';
import 'package:lbzsunalarm/app/routes.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    navigatorKey = GlobalKey<NavigatorState>();

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: pathHome,
      navigatorKey: navigatorKey,
      builder:
          (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          ),
    );
  }
}
