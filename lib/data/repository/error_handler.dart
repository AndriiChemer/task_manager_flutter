import 'package:dio/dio.dart';
import 'package:flutter_task_manager/core/exceptions/exceptions.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';

class ErrorHandler {
  Future<String> getErrorMessage(error) {
    print("ErrorHandler: ${error.toString()}");
    if(error is DioError) {

      var response = error.response;
      var errorMessage = _parseErrorResponse(response);

      throw RemoteException(errorMessage);
    }

    throw error;
  }

  String _parseErrorResponse(Response<dynamic>? response) {
    if (response == null) return "Something went wrong";

    var errorMessage = "";
    var responseError = ErrorResponse.fromJson(response.data);

    var fieldsErrors = responseError.fields;
    if(fieldsErrors == null) return responseError.message;


    responseError.fields!.title.forEach((element) {
      errorMessage += "$element\n";
    });

    return errorMessage;
  }
}