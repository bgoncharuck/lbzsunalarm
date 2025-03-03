import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lbzsunalarm/app/widgets_binding.dart';
import 'package:lbzsunalarm/use_case/i_use_case.dart';

class ConfigWidgetsBinding with IUseCase<void, void> {
  const ConfigWidgetsBinding();

  @override
  Future<void> execute({void params}) async {
    widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    widgetsBinding.preserveSplashScreen();
  }
}
