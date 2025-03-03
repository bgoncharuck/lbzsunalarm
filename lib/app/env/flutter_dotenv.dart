import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lbzsunalarm/app/env.dart';

class DefaultFlutterDotenvWrapper implements Environment {
  final Map<String, String> _variables = {};

  @override
  Map<String, String> get asMap => _variables;

  void _validateVar(String name, String? value) {
    if (value == null || value.isEmpty) {
      throw Exception('Missing or invalid .env: $name');
    }
  }

  @override
  void operator []=(String name, String? value) {
    _validateVar(name, value);
    _variables[name] = value!;
  }

  @override
  String operator [](String name) {
    final value = _variables[name];
    _validateVar(name, value);
    return value!;
  }

  @override
  Future<bool> load(List<String> variables) async {
    await dotenv.load();
    try {
      for (final variable in variables) {
        this[variable] = dotenv.env[variable];
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}
