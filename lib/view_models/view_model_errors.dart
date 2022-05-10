class ViewModelErrors {
  Function() notifyListeners;

  ViewModelErrors({required this.notifyListeners});

  bool _error = false;
  bool get error => _error;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _loading = false;
  bool get loading => _loading;

  String _loadingMessage = '';
  String get loadingMessage => _loadingMessage;

  void startError(String message) {
    _error = true;
    _errorMessage = message;
    notifyListeners();
  }

  void stopError() {
    _error = false;
    notifyListeners();
  }

  void startLoading(String message) {
    _loading = true;
    _loadingMessage = message;
    notifyListeners();
  }

  void stopLoading() {
    _loading = false;
    notifyListeners();
  }
}
