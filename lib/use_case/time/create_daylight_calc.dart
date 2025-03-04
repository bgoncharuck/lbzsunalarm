import 'package:geocoding/geocoding.dart';
import 'package:lbzsunalarm/use_case/i_use_case.dart';
import 'package:suntime/suntime.dart';

class DaylightCalculator {
  const DaylightCalculator({required this.sun, required this.location});

  final Sun sun;
  final Location location;
  double get lat => location.latitude;
  double get lon => location.longitude;
}

class CreateDaylightCalculator
    with IUseCase<List<Location>, DaylightCalculator?> {
  const CreateDaylightCalculator();

  @override
  Future<DaylightCalculator?> execute({required List<Location> params}) async {
    try {
      final location = params.firstOrNull;
      if (location == null) {
        return null;
      }

      return DaylightCalculator(
        sun: Sun(location.latitude, location.longitude),
        location: location,
      );
    } catch (_) {
      return null;
    }
  }
}
