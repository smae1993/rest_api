class ApiRoute {
  String path;
  RequestType type;
  bool authentication;
  ApiRoute(
      {required this.path,
      this.type = RequestType.post,
      this.authentication = false});
}

enum RequestType { get, post, put, patch, delete }
