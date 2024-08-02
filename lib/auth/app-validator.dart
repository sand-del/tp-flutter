import 'package:email_validator/email_validator.dart';

class AppValidator {
  //utilisation de la dépendance email_validator en static pour être utilisé partout
  static String? emailValidator(String? value) {
    if (value == null || value!.isEmpty) {
      return "L'email doit être renseigné";
    }
    if (!EmailValidator.validate(value!)) {
      return "Le format de l'email est incorrect";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Le mot de passe doit être renseigné";
    }

    if (value.length < 8) {
      return "Le mot de passe doit contenir au moins 8 caractères";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Le mot de passe doit contenir au moins une lettre en majuscule";
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Le mot de passe doit contenir au moins une lettre en minuscule";
    }

    if (!value.contains(RegExp(r'[!@\$&*]'))) {
      return "Le mot de passe doit contenir au moins un caractère spécial";
    }

    return null;
  }
}
