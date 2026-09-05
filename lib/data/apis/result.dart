abstract class Result<T> {}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class ServerError<T> extends Result<T> {
  final String message;
  final String code;

  ServerError(this.message, this.code);
}

class NetworkError<T> extends Result<T> {
  final String message;

  NetworkError(this.message);
}
