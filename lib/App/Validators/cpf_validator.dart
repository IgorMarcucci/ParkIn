String? validateCpf(String cpf) {
  if (cpf.isEmpty) {
    return "O campo é obrigatório";
  } else if (!RegExp(r'^[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}$')
      .hasMatch(cpf)) {
    return "O CPF está incorreto";
    // } else if (!RegExp(r'^[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}$')
    //     .hasMatch(cpf)) {
    //   return "O endereço de email está incorreto";
  } else {
    return null;
  }
}
