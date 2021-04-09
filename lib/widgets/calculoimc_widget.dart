import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab8/models/pessoa.dart';

class CalculoImcWidget extends StatefulWidget {
  @override
  _CalculoImcWidgetState createState() => _CalculoImcWidgetState();
}

class _CalculoImcWidgetState extends State<CalculoImcWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController pesocontroller = TextEditingController();
  TextEditingController circunferenciacontroller = TextEditingController();

  Pessoa pessoa = Pessoa();

  String _resultadoimc, _resultadoiac;
  int _radioBtnValue = 1;
  int _radioTypeValue = 1;

  void _handleRadioBtnValChange(int value) {
    setState(() {
      _resultadoiac = _resultadoimc = null;
      _radioBtnValue = pessoa.sexo = value;
    });
  }

  void _handleRadioTypeValChange(int value) {
    setState(() {
      _resultadoiac = _resultadoimc = null;
      _radioTypeValue = value;
    });
  }

  void _calcularimc() {
    pessoa.altura = double.parse(alturacontroller.text) / 100;
    pessoa.peso = double.parse(pesocontroller.text);

    setState(() {
      _resultadoiac = null;
      _resultadoimc = pessoa.imc();
    });
  }

  void _calculariac() {
    pessoa.altura = double.parse(alturacontroller.text) / 100;
    pessoa.circunferencia = double.parse(circunferenciacontroller.text);

    setState(() {
      _resultadoimc = null;
      _resultadoiac = pessoa.iac();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: _radioTypeValue,
                    onChanged: _handleRadioTypeValChange,
                  ),
                  new Text("IMC"),
                  Radio(
                    value: 1,
                    groupValue: _radioTypeValue,
                    onChanged: _handleRadioTypeValChange,
                  ),
                  new Text("IAC")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: _radioBtnValue,
                    onChanged: _handleRadioBtnValChange,
                  ),
                  new Text("Homem"),
                  Radio(
                    value: 1,
                    groupValue: _radioBtnValue,
                    onChanged: _handleRadioBtnValChange,
                  ),
                  new Text("Mulher")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: alturacontroller,
                validator: (value) {
                  return value.isEmpty ? "Informe a altura" : null;
                },
                decoration: InputDecoration(labelText: "Altura em cm:"),
              ),
            ),
            Visibility(
              child: Container(
                margin: EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: pesocontroller,
                  validator: (value) {
                    return value.isEmpty ? "Informe o peso" : null;
                  },
                  decoration: InputDecoration(labelText: "Peso em Kg:"),
                ),
              ),
              visible: _radioTypeValue == 0,
            ),
            Visibility(
              child: Container(
                margin: EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: circunferenciacontroller,
                  validator: (value) {
                    return value.isEmpty
                        ? "Informe a circunferência do quadril"
                        : null;
                  },
                  decoration:
                      InputDecoration(labelText: "Circunferência do quadril:"),
                ),
              ),
              visible: _radioTypeValue == 1,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(_resultadoimc == null
                  ? _resultadoiac == null
                      ? ""
                      : "IAC: $_resultadoiac"
                  : "IMC: $_resultadoimc"),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    if (_radioTypeValue == 0)
                      _calcularimc();
                    else
                      _calculariac();
                  }
                },
                child: Text("Calcular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
