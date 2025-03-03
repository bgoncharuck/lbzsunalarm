import 'package:lbzsunalarm/app/env.dart';
import 'package:lbzsunalarm/app/env/flutter_dotenv.dart';
import 'package:lbzsunalarm/use_case/i_use_case.dart';

class InitializeEnvironment with IUseCase<List<String>, bool> {
  const InitializeEnvironment();

  @override
  Future<bool> execute({required List<String> params}) async {
    env = DefaultFlutterDotenvWrapper();
    return env.load(params);
  }
}
