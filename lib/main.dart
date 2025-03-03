import 'package:flutter/widgets.dart';
import 'package:lbzsunalarm/app/entry_point.dart';
import 'package:lbzsunalarm/use_case/app/init_app.dart';

Future<void> main() async {
  await const InitializeApp().execute(params: () => runApp(const EntryPoint()));
}
