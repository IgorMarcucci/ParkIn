String? validateUsername(String name) {
  if (name.length < 3) {
    return "Nome muito pequeno";
  }
  if (name.isEmpty) {
    return "O campo é obrigatório";
  } else {
    return null;
  }
}
