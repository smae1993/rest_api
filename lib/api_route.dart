class ApiRoute {
  String path;
  RequestType type;
  bool authentication;

  /// input params as string, string map
  Map<String, String>? inputs;

  /// header params as string, string map
  Map<String, String> headers;
  ApiRoute(
      {required this.path,
      this.type = RequestType.post,
      this.authentication = false,
      this.headers = const {}});
}

enum RequestType { get, post, put, patch, delete }
