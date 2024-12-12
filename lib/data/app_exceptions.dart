// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString(){
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]): super(message, 'No internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]): super(message, 'Request Time Out');
}

class ServerException extends AppExceptions {
  ServerException([String? message]): super(message, 'internal server error');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, 'Error during communication');
}

class BadRequetException extends AppExceptions {
  BadRequetException([String? message]) : super(message, 'Invalid Request');
}

class UnAuthorisedException extends AppExceptions {
  UnAuthorisedException([String? message]) : super(message, 'Un-Authorised Request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}