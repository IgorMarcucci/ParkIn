String? validateEmail(String email) {
  if (email.isEmpty) {
    return "O campo é obrigatório";
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    return "O endereço de email está incorreto";
  } else {
    return null;
  }
}
