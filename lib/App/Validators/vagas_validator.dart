String? numberValidator(String value) {
  final valor = num.tryParse(value);
  if(valor == null) {
    return 'O campo é obrigatório';
  } else if (valor > 300){
    return 'Limite de vagas excedido';
  }
  return null;
}