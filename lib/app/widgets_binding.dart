import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

late final WidgetsBinding widgetsBinding;
bool _splashScreenStopped = false;

extension NativeSplashPreservation on WidgetsBinding {
  void preserveSplashScreen() {
    FlutterNativeSplash.preserve(widgetsBinding: this);
  }

  void removeSplashScreen() {
    /// native splash can be removed only once
    if (_splashScreenStopped) {
      return;
    }
    FlutterNativeSplash.remove();
    _splashScreenStopped = true;
  }
}
