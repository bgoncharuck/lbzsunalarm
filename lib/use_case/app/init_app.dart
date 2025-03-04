// import 'package:lbzsunalarm/use_case/app/init_env.dart';
import 'package:lbzsunalarm/use_case/app/widget_binding.dart';
import 'package:lbzsunalarm/use_case/i_use_case.dart';

/// params is `runApp` function
class InitializeApp with IUseCase<void Function(), void> {
  const InitializeApp();

  @override
  Future<void> execute({required void Function() params}) async {
    await Future.wait([
      const ConfigWidgetsBinding().execute(),
      // const InitializeEnvironment().execute(params: [/*write your env variables here*/]),
    ]);

    params();
  }
}
