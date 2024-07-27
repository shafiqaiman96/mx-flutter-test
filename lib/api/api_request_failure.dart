class ApiRequestFailure {
  const ApiRequestFailure._();

  factory ApiRequestFailure.notFound() = NotFound;
  factory ApiRequestFailure.connectionTimeout() = ConnectionTimeout;
  factory ApiRequestFailure.fetchProductListFailed({
    int? statusCode,
    Object? message,
  }) = FetchProductListFailed;
}

class NotFound extends ApiRequestFailure {
  const NotFound() : super._();
}

class ConnectionTimeout extends ApiRequestFailure {
  const ConnectionTimeout() : super._();
}

class FetchProductListFailed extends ApiRequestFailure {
  final int? statusCode;
  final Object? message;

  const FetchProductListFailed({this.statusCode, this.message}) : super._();
}
