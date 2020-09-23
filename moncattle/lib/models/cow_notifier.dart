import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:moncattle/models/alert.dart';
import 'package:moncattle/models/cow.dart';
import 'dart:math';

class CowNotifier extends ChangeNotifier {
  final List<Cow> _cows = [];
  final List<Alert> _alerts = [];
  UnmodifiableListView<Cow> get cows => UnmodifiableListView(_cows);
  UnmodifiableListView<Alert> get alerts => UnmodifiableListView(_alerts);

  void add(Cow cow) {
    Random random = new Random();
    double randomNumber = random.nextInt(10) / 10000.0;
    cow.lat = -8.014995 - randomNumber;
    cow.lon = -34.949509 - randomNumber;
    _cows.add(cow);
    _cows.sort((a, b) => a.hist.compareTo(b.hist));
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(int index) {
    _cows.removeAt(index);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _cows.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addAlert(Alert alert) {
    _alerts.add(alert);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeAlert(int index) {
    _alerts.removeAt(index);
    notifyListeners();
  }
}
