String? validateMoney(String money) {
  if (money.isEmpty) {
    return "O campo é obrigatório";
  } else {
    return null;
  }
}