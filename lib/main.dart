import 'package:flutter/widgets.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('test', textDirection: TextDirection.ltr));
}
