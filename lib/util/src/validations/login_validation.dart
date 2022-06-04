
import '../exceptions/validation_exception.dart';
import '../models/login_model.dart';
import '../utils/string_util.dart';

/// Verifica se os campos de login estão vazios.
///
/// Caso estejam, o método lança [ValidationException] com campos preenchidos.
void validateLogin(LoginModel model) {
  if (model.username != null &&
      model.password !=
          null) if (isEmpty(model.username!) || isEmpty(model.password!)) {
    throw new ValidationException(
        title: 'Campos vazios', message: 'Um ou mais campos estão vazios');
  }
}
