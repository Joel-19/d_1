import 'package:d_1/src/data/data_source/helpers/http_method.dart';
import 'http_result.dart';
import 'parse_response_body.dart';
import 'send_request.dart';

typedef Parser<T> = T Function(dynamic data);

class Http {
  final String baseUrl;
  Http({this.baseUrl = ""});

  Future<HttpResult<T>> request<T>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParameters = const {},
    dynamic body,
    Parser<T>? parser,
    Duration timeOut = const Duration(seconds: 10),
  }) async {
    print("inicio - - - - - - - ");
    int? statusCode;
    dynamic data;
    try {
      late Uri url;
      if (path.startsWith("htt://") || path.startsWith("https://")) {
        url = Uri.parse(path);
      } else {
        url = Uri.parse("$baseUrl$path");
      }
      print(url);

      if (queryParameters.isNotEmpty) {
        url = url.replace(queryParameters: {
          ...url.queryParameters,
          ...queryParameters,
        });
      }
      final response = await sendRequest(
        url: url,
        method: method,
        headers: headers,
        body: body,
        timeOut: timeOut,
      );
      data = parseResponseBody(response.body);
      statusCode = response.statusCode;
      print(statusCode);
      if (statusCode >= 400) {
        throw HttpError(
          exception: null,
          stackTrace: StackTrace.current,
          data: data,
        );
      }
      return HttpResult(
          data: parser != null ? parser(data) : data,
          error: null,
          statusCode: statusCode);
    } catch (e, s) {
      print(e);
      if (e is HttpError) {
        return HttpResult<T>(
          data: null,
          error: e,
          statusCode: statusCode!,
        );
      }

      return HttpResult<T>(
        data: null,
        error: HttpError(exception: e, stackTrace: s, data: data),
        statusCode: -1,
      );
    }
  }
}
