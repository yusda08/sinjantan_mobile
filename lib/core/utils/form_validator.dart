import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password tidak boleh kosong'),
  MinLengthValidator(8, errorText: 'Password minimal 8 karakter'),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email tidak boleh kosong'),
  EmailValidator(errorText: 'Email tidak valid')
]);

final phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'Tidak boleh kosong'),
  PhoneValidator(errorText: 'Nomor tidak valid'),
  MinLengthValidator(11, errorText: 'Nomor tidak valid')
]);

final defaultValidator =
    RequiredValidator(errorText: 'Input tidak boleh kosong');

class PhoneValidator extends TextFieldValidator {
  PhoneValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    return hasMatch(r'^-?[0-9]+$', value!);
  }
}
