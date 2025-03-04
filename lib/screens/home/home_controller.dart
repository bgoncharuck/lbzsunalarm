import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/volume_settings.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart';
import 'package:lbzsunalarm/app/widgets_binding.dart';
import 'package:lbzsunalarm/logic.dart';
import 'package:lbzsunalarm/use_case/time/create_daylight_calc.dart';
import 'package:lbzsunalarm/use_case/time/create_locations.dart';

class HomeScreenController extends ScreenController {
  HomeScreenController();
  static const locationNotFound = 'No Location Found or No Internet';
  static const defaultLocation = 'Kyiv';

  final TextEditingController locationSearch = TextEditingController();
  final Map<String, DaylightCalculator> dlc = {};
  String currentLocation = '';

  DateTime? selectedTime;

  void init() {
    /// test
    selectedTime = null;
    locationSearch.text = defaultLocation;
    addLocation(defaultLocation);
    currentLocation = defaultLocation;

    ///

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
      return locationNotFound;
    }

    final dayLightCalc = await const CreateDaylightCalculator().execute(
      params: locations,
    );
    if (dayLightCalc == null) {
      return locationNotFound;
    }

    dlc[location] = dayLightCalc;
    return location;
  }

  void todaySunset() {
    final calc = dlc[currentLocation];
    if (calc == null) {
      return;
    }
    final today = DateTime.now();

    selectedTime = calc.sun.getLocalSunsetTime(
      latLngToTimezoneString(calc.lat, calc.lon),
      date: today,
    );
  }

  void tomorrowSunrise() {
    final calc = dlc[currentLocation];
    if (calc == null) {
      return;
    }
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    selectedTime = calc.sun.getLocalSunriseTime(
      latLngToTimezoneString(calc.lat, calc.lon),
      date: tomorrow,
    );
  }

  void todaySunrise() {
    final calc = dlc[currentLocation];
    if (calc == null) {
      return;
    }
    final today = DateTime.now();

    selectedTime = calc.sun.getLocalSunriseTime(
      latLngToTimezoneString(calc.lat, calc.lon),
      date: today,
    );
  }

  Future<void> setAlarm() async {
    if (selectedTime == null) {
      return;
    }

    final alarmSettings = AlarmSettings(
      id: 42,
      dateTime: selectedTime!,
      assetAudioPath: 'assets/alarm.mp3',
      // loopAudio: true,
      // vibrate: true,
      warningNotificationOnKill: Platform.isIOS,
      // androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: const Duration(seconds: 5),
        volumeEnforced: true,
      ),
      notificationSettings: NotificationSettings(
        title: 'Sunset Alarm Test',
        body:
            '${selectedTime!.day}/${selectedTime!.month}/${selectedTime!.year}'
            '\n${selectedTime!.hour}:${selectedTime!.minute}',
        stopButton: 'Stop',
        icon: 'notification_icon',
      ),
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }

  Future<void> cancelAlarm() async {
    await Alarm.stop(42);
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
