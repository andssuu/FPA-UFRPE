import 'package:flutter/material.dart';
import 'package:moncattle/models/cow_notifier.dart';
import 'package:provider/provider.dart';
import 'models/cow.dart';

class AddAnimal extends StatefulWidget {
  @override
  _AddAnimalState createState() => _AddAnimalState();
}

class _AddAnimalState extends State<AddAnimal> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController idCollarController = new TextEditingController();
  TextEditingController breedController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();

  showAlertDialog(BuildContext context, String msg) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Validação de dados"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameAnimal = TextField(
      controller: nameController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nome do animal",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final idCollar = TextField(
      controller: idCollarController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "ID Coleira",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
    var items = ['Holandesa', 'Girolando', 'Jersey', 'Gir'];
    final breed = TextField(
      controller: breedController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Raça",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        suffixIcon: PopupMenuButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          onSelected: (String value) {
            breedController.text = value;
          },
          itemBuilder: (BuildContext context) {
            return items.map<PopupMenuItem<String>>((String value) {
              return new PopupMenuItem(
                child: new Text(value),
                value: value,
              );
            }).toList();
          },
        ),
      ),
    );

    final weight = TextField(
      controller: weightController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Peso",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final addButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.black87,
      child: MaterialButton(
        child: Text(
          "Adicionar",
          textAlign: TextAlign.center,
        ),
        textColor: Colors.white,
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (nameController.text.isEmpty) {
            showAlertDialog(context, 'Nome do animal vazio');
          } else if (idCollarController.text.isEmpty) {
            showAlertDialog(context, 'ID Colar inválido');
          } else if (!items.contains(breedController.text)) {
            showAlertDialog(context, 'Raça inválida');
          } else if (weightController.text.isEmpty) {
            showAlertDialog(context, 'Peso Inválido');
          } else {
            var cows = context.read<CowNotifier>();
            cows.add(
              Cow(
                  name: nameController.text,
                  idCollar: idCollarController.text,
                  weight: weightController.text,
                  breed: breedController.text),
            );
            Navigator.pop(context);
          }
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Novo Animal'),
      ),
      body: Center(
        child: Container(
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                nameAnimal,
                SizedBox(height: 10.0),
                idCollar,
                SizedBox(
                  height: 10.0,
                ),
                breed,
                SizedBox(
                  height: 10.0,
                ),
                weight,
                SizedBox(
                  height: 10.0,
                ),
                addButton,
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
