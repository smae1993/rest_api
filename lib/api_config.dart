class ApiConfig {
  String url;
  String? token;
  String tokenParam;

  Function? logoutCallback;
  ApiConfig(this.url,
      {this.token,
      this.timeout = const Duration(seconds: 5),
      this.tokenParam = "token",
      this.logoutCallback});

  Duration timeout;
}

enum DisplayErrorType {
  none,
  glassyDialog,
  simpleDialog,
}
