import 'package:proyectoparqueovialidad/Bienvenida/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static final Preferences _instance = Preferences._();

  factory Preferences() {
    return _instance;
  }

  Preferences._();

  SharedPreferences? _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get initialPage {
    return _prefs!.getString('initialPage') ?? OnboardingPage.id;
  }

  set initialPage(String value) {
    _prefs!.setString('initialPage', value);
  }
}