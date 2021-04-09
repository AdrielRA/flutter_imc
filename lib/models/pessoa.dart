import 'dart:math';

class Pessoa {
  double peso, altura, circunferencia;
  int sexo;

  Pessoa();

  String imc() {
    double imc = peso / pow(altura, 2);
    return imc.toStringAsFixed(2) + "\n\n" + classificar("imc", imc);
  }

  iac() {
    double iac = (circunferencia / (altura * sqrt(altura))) - 18;
    return iac.toStringAsFixed(2) + "\n\n" + classificar("iac", iac);
  }

  String classificar(String type, double val) {
    String strclassificacao;

    if (type == "imc") {
      if (sexo == 1) {
        if (val < 18.6)
          strclassificacao = "Abaixo do peso";
        else if (val < 25)
          strclassificacao = "Peso ideal";
        else if (val < 30)
          strclassificacao = "Levemente acima do peso";
        else if (val < 35)
          strclassificacao = "Obesidade grau I";
        else if (val < 40)
          strclassificacao = "Obesidade grau II";
        else
          strclassificacao = "Obesidade grau III";
      } else {
        if (val < 20)
          strclassificacao = "Abaixo do peso";
        else if (val < 24.9)
          strclassificacao = "Peso ideal";
        else if (val < 29.9)
          strclassificacao = "Levemente acima do peso";
        else if (val < 39.9)
          strclassificacao = "Obesidade grau I";
        else if (val < 43)
          strclassificacao = "Obesidade grau II";
        else
          strclassificacao = "Obesidade grau III";
      }
    } else {
      if (sexo == 0) {
        if (val < 8)
          strclassificacao = "Abaixo do normal";
        else if (val < 20.9)
          strclassificacao = "Adiposidade normal";
        else if (val < 25)
          strclassificacao = "Sobrepeso";
        else
          strclassificacao = "Obesidade";
      } else {
        if (val < 21)
          strclassificacao = "Abaixo do normal";
        else if (val < 32.9)
          strclassificacao = "Adiposidade normal";
        else if (val < 38)
          strclassificacao = "Sobrepeso";
        else
          strclassificacao = "Obesidade";
      }
    }

    return strclassificacao;
  }
}
