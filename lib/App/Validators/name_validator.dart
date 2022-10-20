String? validateName(String name) {
  if (name.length < 3) {
    return "Nome muito pequeno";
  }
  if (name.isEmpty) {
    return "O campo é obrigatório";
  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(name)) {
    return "O nome inserido está incorreto";
  } else {
    return null;
  }
}
