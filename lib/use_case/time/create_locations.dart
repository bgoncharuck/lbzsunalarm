import 'package:geocoding/geocoding.dart';
import 'package:lbzsunalarm/use_case/i_use_case.dart';

class CreateSunsetLocations with IUseCase<String, List<Location>> {
  const CreateSunsetLocations();

  @override
  Future<List<Location>> execute({required String params}) async {
    try {
      return locationFromAddress(params);
    } catch (_) {
      return [];
    }
  }
}
