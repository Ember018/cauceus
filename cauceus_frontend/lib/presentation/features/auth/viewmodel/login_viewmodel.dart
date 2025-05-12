import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> loginUser(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    print('Viewmodel: Attempting login for $username ...');
    await Future.delayed(const Duration(seconds: 2));

    _errorMessage = 'Login failed: Invalid credentials';
    final success = false;

    _isLoading = false;
    notifyListeners();

    return success;
  }

  void clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }
}
