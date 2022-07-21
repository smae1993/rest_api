library rest_api;

import 'package:http/http.dart';
import 'package:rest_api/api_config.dart';
import 'package:rest_api/api_response.dart';
import 'package:rest_api/api_response_types.dart';
import 'package:rest_api/api_route.dart';
import 'package:http/http.dart' as http;

ApiConfig restApiConfig = ApiConfig("yourWebsiteUrl");

/// A RestApi Library that handling jwt and passport token base authentication.
class RestApi {
  ApiRoute route;
  Map<String, String>? inputs;
  Map<String, String> headers;
  bool authentication;
  late Uri uri;

  RestApi(this.route,
      {this.authentication = true, this.inputs, this.headers = const {}}) {
    fillHeaders();
    uri = Uri.parse(restApiConfig.url + route.path);
  }

  void fillHeaders() {
    try {
      // headers = {
      //   // 'Content-Type': '*',
      //   // 'Accept': '*',
      // };
      if (authentication) {
        headers.putIfAbsent(
            "Authorization", () => 'Bearer ${restApiConfig.token}');
      }
    } catch (e) {
      // headers = {};
    }
  }

  // Future<void> download(Function(double) progressCallback,
  //     Function(List<int>) resultCallback) async {
  //   List<int> bytes = [];
  //   int received = 0;
  //   var request = http.Request(
  //     route.isPost ? 'POST' : 'GET',
  //     uri,
  //   );
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await http.Client().send(request);

  //   int total = 0;
  //   try {
  //     total = int.parse(response.headers['filesize']!);
  //   } catch (e) {
  //     LogPrint(LogType.error, "Api Error => $e");
  //   }
  //   response.stream.listen((value) {
  //     bytes.addAll(value);
  //     received += value.length;
  //     progressCallback(((received) / total));
  //   }).onDone(() async {
  //     resultCallback(bytes);
  //   });
  // }

  Future<ApiResponse> connect() async {
    Response response;
    switch (route.type) {
      case RequestType.get:
        response = await http
            .get(uri, headers: headers)
            .timeout(restApiConfig.timeout);
        break;
      case RequestType.post:
        response = await http
            .post(uri, body: inputs, headers: headers)
            .timeout(restApiConfig.timeout);
        break;
      case RequestType.put:
        response = await http
            .put(uri, body: inputs, headers: headers)
            .timeout(restApiConfig.timeout);
        break;
      case RequestType.patch:
        response = await http
            .patch(uri, body: inputs, headers: headers)
            .timeout(restApiConfig.timeout);
        break;
      case RequestType.delete:
        response = await http
            .delete(uri, body: inputs, headers: headers)
            .timeout(restApiConfig.timeout);
        break;
    }

    ApiResponse apiResponse = ApiResponse(
        ResponseType.values
            .firstWhere((element) => element.code == response.statusCode),
        response.body);

    // var response = route.isPost
    //     ? await http
    //         .post(uri, body: inputs, headers: headers)
    //         .timeout(restApiConfig.timeout)
    //     : await http
    //         .get(uri, headers: headers)
    //         .timeout(const Duration(seconds: 5));
    handleErrors(apiResponse);
    return apiResponse;
  }

  void handleErrors(ApiResponse response) {
    // String errorString = "";
    // switch (response.statusCode) {
    //   case 401:
    //     {
    //       var userController = Get.find<UserController>();
    //       userController.logout();
    //     }
    //     break;
    //   case 503:
    //     {
    //       errorString =
    //           "سرور در حال بروز رسانی است\nلطفا پس از دقایقی دوباره امتحان کنید ...";
    //     }
    //     break;
    //   case 422:
    //   case 500:
    //   case 403:
    //     {
    //       var errorsJson = json.decode(response.body)['errors'];
    //       if (errorsJson is Map) {
    //         errorsJson.forEach((key, value) {
    //           (value as List).forEach((element) {
    //             errorString += "${element as String}\n";
    //           });
    //         });
    //       } else if (errorsJson is List) {
    //         errorsJson.forEach((element) {
    //           (element as List).forEach((value) {
    //             errorString += "${value as String}\n";
    //           });
    //         });
    //       }
    //     }
    //     break;
    // }

    // if (errorString.isNotEmpty) {
    //   Get.snackbar("خطا", errorString,
    //       snackPosition: SnackPosition.BOTTOM,
    //       snackStyle: SnackStyle.FLOATING,
    //       margin: const EdgeInsets.all(8),
    //       icon: const Icon(Icons.error, size: 30, color: Colors.white));
    // }
  }
}
