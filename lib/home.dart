import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _moedaController = TextEditingController();
  String _valorRecuperado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mascáras e validações'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            
            // CPF
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite o cpf',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),

            // CNPJ
            TextField(
              controller: _cnpjController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite o CNPj',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter(),
              ],
            ),

            // CEP
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite o CEP',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),

            // TELEFONE
            TextField(
              controller: _telefoneController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite o telefone',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
            ),

            // DATA
            TextField(
              controller: _dataController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite a data',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter(),
              ],
            ),

            // MOEDA
            TextField(
              controller: _moedaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite o valor',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                //RealInputFormatter(moeda: true),
                CentavosInputFormatter(moeda: true),
              ],
            ),

            ElevatedButton(
              onPressed: (){

                setState(() {
                  //_valorRecuperado = _cpfController.text.toString();
                  //_valorRecuperado = _cnpjController.text.toString();
                  //_valorRecuperado = _cepController.text.toString();
                  //_valorRecuperado = _telefoneController.text.toString();
                  //_valorRecuperado = _dataController.text.toString();
                  //_valorRecuperado = _moedaController.text.toString();

                  // salvando no Banco de dados como uma string
                  /* String moedaBD = _moedaController.text.toString();
                  moedaBD = moedaBD.replaceAll(".", "");
                  moedaBD = moedaBD.replaceAll(",", ".");
                  //

                  // Recuperando o valor da moeda do BD que foi
                  // salvo como string
                  double valorDouble = double.parse(moedaBD);
                  double total = valorDouble;
                  var formatador = NumberFormat("#,##0.00", "pt_BR");
                  var resultado = formatador.format(valorDouble);

                  //_valorRecuperado = resultado;
                  _valorRecuperado = "BD ${moedaBD} / Exibição ${resultado}";
                  // */

                  // Padroes
                  /* for (var item in Estados.listaEstados) {
                    debugPrint("item: $item");
                  } */

                  /* for (var item in Estados.listaEstadosSigla){
                    debugPrint("item: $item");
                  }
 */
                  /* for (var item in Meses.listaMeses){
                    debugPrint("item: $item");
                  } */

                  for (var item in Semana.listaDiasSemana){
                    debugPrint("item: $item");
                  }

                });

              }, 
              child: const Text('Recuperar o valor'),
            ),
 

            Text(
              'Valor: $_valorRecuperado',
              style: const TextStyle(fontSize: 25),
            ),
 
          ],
        ),
      ),
    );  
  }
}