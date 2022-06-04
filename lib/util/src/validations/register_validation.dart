
import '../exceptions/validation_exception.dart';
import '../models/register_model.dart';
import '../utils/string_util.dart';
import 'login_validation.dart';

/// Verifica se os campos de cadastro estão vazios.
///
/// Caso estejam, o método lança [ValidationException] com campos preenchidos.
void validateRegister(RegisterModel model) {
  validateLogin(model.toLoginModel());
  if (model.name != null) if (isEmpty(model.name!)) {
    throw new ValidationException(
        title: 'Campos vazios', message: 'Um ou mais campos estão vazios');
  }
}
