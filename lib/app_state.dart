import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Quote = prefs.getString('ff_Quote') ?? _Quote;
    });
    _safeInit(() {
      _Author = prefs.getString('ff_Author') ?? _Author;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _Quote = '';
  String get Quote => _Quote;
  set Quote(String value) {
    _Quote = value;
    prefs.setString('ff_Quote', value);
  }

  String _Author = '';
  String get Author => _Author;
  set Author(String value) {
    _Author = value;
    prefs.setString('ff_Author', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
