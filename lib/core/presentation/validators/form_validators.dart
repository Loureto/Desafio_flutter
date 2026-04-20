class FormValidators {
  const FormValidators._();

  static String get _invalidField => 'Campo inválido';
  static String get _requiredField => 'Campo obrigatório';

  static String? validField(String? value) {
    return value != null && value.trim().isNotEmpty ? null : _requiredField;
  }

  static String? validEmail(String? value) {
    final error = validField(value);
    if (error != null) return error;

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(value!) ? null : _invalidField;
  }

  static String? validPassword(String? value, {int minLength = 8}) {
    final error = validField(value);
    if (error != null) return error;

    return value!.length >= minLength ? null : _invalidField;
  }

  static String? validFullName(String? value, {int minLength = 3}) {
    final error = validField(value);
    if (error != null) return error;

    return value!.trim().length >= minLength ? null : _invalidField;
  }
}
