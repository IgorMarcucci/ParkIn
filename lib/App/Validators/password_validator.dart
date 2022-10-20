String? validatePassword(String password) {
  if (password.isEmpty == true) {
    return 'O campo é obrigatório';
  } else if (password.length < 8 || password.length > 32) {
    return 'Digite uma senha entre 8 e 32 caracteres';
  }
  return null;
}
