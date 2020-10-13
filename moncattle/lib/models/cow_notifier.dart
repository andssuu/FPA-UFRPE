import 'dart:collection';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:moncattle/models/alert.dart';
import 'package:moncattle/models/cow.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class CowNotifier extends ChangeNotifier {
  List<Cow> _cows = [];
  List<Alert> _alerts = [];
  UnmodifiableListView<Cow> get cows => UnmodifiableListView(_cows);
  UnmodifiableListView<Alert> get alerts => UnmodifiableListView(_alerts);

  saveCows() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('cows', jsonEncode(_cows));
  }

  saveAlerts() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('alerts', jsonEncode(_alerts));
  }

  void addCow(Cow cow) {
    Random random = new Random();
    double randomNumber = random.nextInt(10) / 10000.0;
    cow.lat = -8.014995 - randomNumber;
    cow.lon = -34.949509 - randomNumber;
    _cows.add(cow);
    //_cows.sort((a, b) => a.hist.compareTo(b.hist));
    // This call tells the widgets that are listening to this model to rebuild.
    saveCows();
    notifyListeners();
  }

  void removeCow(int index) {
    _cows.removeAt(index);
    saveCows();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _cows = [];
    _alerts = [];
    saveCows();
    saveAlerts();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addAlert(Alert alert) {
    _alerts.add(alert);
    // This call tells the widgets that are listening to this model to rebuild.
    saveAlerts();
    notifyListeners();
  }

  void removeAlert(int index) {
    _alerts.removeAt(index);
    saveAlerts();
    notifyListeners();
  }
}
