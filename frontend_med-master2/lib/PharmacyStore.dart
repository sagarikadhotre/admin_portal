 /*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class STORE extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

var _scaffoldKey = new GlobalKey<ScaffoldState>();

class _StoreState extends State<STORE> {
  var nametec = <TextEditingController>[];
  var adresstec = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var NameCont = TextEditingController();
    var AdressCont = TextEditingController();
    nametec.add(NameCont);
    adresstec.add(AdressCont);
  
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Store ${cards.length + 1}'),
          TextField(
              controller: NameCont,
              decoration: InputDecoration(labelText: 'Store Name')),
          // SizedBox(height:15),
          TextField(
              style:
                  TextStyle(fontSize: 15.0, height: 5.0, color: Colors.black),
              controller: AdressCont,
              decoration: InputDecoration(labelText: 'Adress')),
          //SizedBox(height:15),
          
          //SizedBox(height: 16,),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  /*_onDone() {
    List<MedEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      var comp = compTECs[i].text;
      var usage = usageTECs[i].text;
      entries.add(MedEntry(name, comp, usage));
    }
    Navigator.pop(context, entries);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pharmacy Store : Genera'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Text('Add Store'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () {
            _showDialog();
          },
          backgroundColor: Colors.green),
    );
  }
}

void _showDialog() {
  // flutter defined function
  showDialog(
    context: _scaffoldKey.currentContext,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Store entry status:",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green[800])),
        content: new Text("YOUR STORE SUCCESSFULLY SAVED INTO DATABASE!",
            textAlign: TextAlign.center),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("OK", style: TextStyle(color: Colors.green[800])),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
*/