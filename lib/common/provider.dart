import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/storage.dart';

class ThemeModel with ChangeNotifier {
  String _theme = 'lightGreen';

  String getTheme() {
    LocalStorage.get('theme').then((String theme) {
      if (_theme != theme) {
        _theme = theme;
        notifyListeners();
      }

    });
    return _theme;
  }

  void setTheme(String theme) {
    if (theme != _theme) {
      _theme = theme;
      LocalStorage.set('theme', theme);
      notifyListeners();
    }
  }
}
