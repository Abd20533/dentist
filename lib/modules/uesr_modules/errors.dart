class ErrorDetails {
  final String message;
  final Map<String, List<String>> errors;

  ErrorDetails({
    required this.message,
    required this.errors,
  });

  // Factory method to create ErrorDetails from JSON
  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      message: json['message'],
      errors: Map<String, List<String>>.from(json['errors'].map((key, value) => MapEntry(key, List<String>.from(value)))),
    );
  }

  // Method to convert ErrorDetails to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'message': message,
  //     'errors': errors.map((key, value) => MapEntry(key, value)),
  //   };
  // }
}


class ValidationError {
  final String message;
  final Map<String, List<String>> errors;

  ValidationError({
    required this.message,
    required this.errors,
  });

  // Factory method to create ValidationError from JSON
  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      message: json['message'],
      errors: Map<String, List<String>>.from(
          json['errors'].map((key, value) => MapEntry(key, List<String>.from(value)))),
    );
  }

  // Method to convert ValidationError to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'message': message,
  //     'errors': errors.map((key, value) => MapEntry(key, value)),
  //   };
  // }
}


// testing

// ValidationError validationError = ValidationError.fromJson(jsonResponse);
// print(validationError.message); // The first name field is required. (and 4 more errors)
// print(validationError.errors['first_name']); // [The first name field is required.]