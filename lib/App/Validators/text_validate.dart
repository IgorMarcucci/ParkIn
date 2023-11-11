String? textValidate(String value) {
  if (value.isEmpty) {
    return "O campo é obrigatório";
  } else {
    return null;
  }
}
