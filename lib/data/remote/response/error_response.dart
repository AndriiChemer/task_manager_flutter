class ErrorResponse {
  final String message;
  final ValidationErrorResponse? fields;

  ErrorResponse({required this.message, this.fields});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {

    ValidationErrorResponse? fields;
    if(json.containsKey("fields")) {
      fields = ValidationErrorResponse.fromJson(json['fields']);
    }

    return ErrorResponse(
      message: json["message"] ?? "Something went wrong",
      fields: fields
    );
  }
}

class ValidationErrorResponse {
  final List<String> title;

  ValidationErrorResponse({required this.title});

  factory ValidationErrorResponse.fromJson(Map<String, dynamic> json) {
    List<String> messageList = [];

    json.forEach((key, value) {

      if(value is List) {

        (value).forEach((message) {
          messageList.add(message.toString());
        });

      } else {

        messageList.add(value.toString());
      }
    });

    return ValidationErrorResponse(
        title: messageList
    );
  }
}