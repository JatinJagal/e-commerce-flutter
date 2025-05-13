import 'package:e_commerce/utils/utils.dart';

String? emailValidator(String? fieldContent) {
  if (!isEmail(fieldContent!)) {
    return "Please Enter valida email id";
  }
  return null;
}

String? passValidator(String? fieldContent) =>
    fieldContent!.isEmpty ? "Enter Password, use 8 character" : null;

String? userNameValidator(String? fieldContent) =>
    fieldContent!.isEmpty ? "Enter UserName" : null;
