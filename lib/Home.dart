import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var resultado = "";

class _HomeState extends State<Home> {
  TextEditingController controllerAlcool = TextEditingController();
  TextEditingController controllerGasolina = TextEditingController();

  void calcular() {
    double? precoAlcool = double.tryParse(controllerAlcool.text);
    double? precoGasolina = double.tryParse(controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        resultado =
            "Número invalido, digite números maiores que 0 e utilizando (.) no lugar de (,)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          resultado = "Melhor abastecer com gasolina!";
        });
      } else {
        setState(() {
          resultado = "Melhor abastecer com alcool!";
        });
      }
    }

    limpar();
  }

  void limpar() {
    controllerAlcool.text = "";
    controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("imagens/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecer o seu carro",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço alcool, ex: 4.59',
              ),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço gasolina, ex: 5.59',
              ),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: calcular,
                child: Text("Calcular"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(20),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                resultado,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
