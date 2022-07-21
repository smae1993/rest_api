import 'dart:convert';

import 'package:rest_api/api_response_types.dart';

class ApiResponse {
  ApiResponse(this.type, this.response);
  String response;
  ResponseType type;

  Map<String, dynamic> getJson() {
    try {
      return json.decode(response);
    } catch (e) {
      return {};
    }
  }
}
