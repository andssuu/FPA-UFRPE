import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:moncattle/models/cow.dart';

class CowNotifier extends ChangeNotifier {
  final List<Cow> _cows = [];
  UnmodifiableListView<Cow> get cows => UnmodifiableListView(_cows);

  void add(Cow cow) {
    _cows.add(cow);
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
}
