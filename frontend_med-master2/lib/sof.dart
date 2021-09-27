import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/server.dart';

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

var _scaffoldKey = new GlobalKey<ScaffoldState>();

class _SOFState extends State<SOF> {
  List<Widget> cards = [];
  List<GlobalKey<_FormCardState>> _keys = [];

  @override
  void initState() {
    super.initState();
    GlobalKey<_FormCardState> key = GlobalKey();
    _keys.add(key);
    cards.add(FormCard(key: key));
  }

  _onDone() {
    bool done = true;
    for (int i = 0; i < cards.length; i++) {
      if (!_keys[i].currentState.isValidated()) {
        done = false;
        break;
      }
    }
    if (done) {
      for (int i = 0; i < cards.length; i++) {
        _keys[i].currentState.submit();
      }
      _showSuccessDialog();
    } else {
      _showErrorDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Admin Portal-Genera'),
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
            child: ElevatedButton(
              child: Text('Add New Medicine'),
              onPressed: () => setState(() {
                GlobalKey<_FormCardState> key = GlobalKey();
                _keys.add(key);
                cards.add(FormCard(key: key));
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: _onDone,
          backgroundColor: Colors.green),
    );
  }
}

class FormCard extends StatefulWidget {
  const FormCard({Key key}) : super(key: key);

  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String composition;
  String usage;

  bool isValidated() => _formKey.currentState.validate();

  void submit() {
    if (isValidated()) {
      _formKey.currentState.save();
      Server.addMedicine(name, composition, usage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Medicine'),
            TextFormField(
              decoration: InputDecoration(labelText: 'Medicine Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (String value) {
                this.name = value;
              },
            ),
            // SizedBox(height:15),
            TextFormField(
              decoration: InputDecoration(labelText: 'Composition'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              style:
                  TextStyle(fontSize: 15.0, height: 5.0, color: Colors.black),
              onSaved: (String value) {
                this.composition = value;
              },
            ),
            //SizedBox(height:15),
            TextFormField(
              decoration: InputDecoration(labelText: 'Usage'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              style:
                  TextStyle(fontSize: 20.0, height: 5.0, color: Colors.black),
              onSaved: (String value) {
                this.usage = value;
              },
            ),
            //SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}

void _showSuccessDialog() {
  showDialog(
    context: _scaffoldKey.currentContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Medicine entry status:",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green[800])),
        content: new Text("MEDICINES SUCCESSFULLY SAVED INTO DATABASE!",
            textAlign: TextAlign.center),
        actions: <Widget>[
          new TextButton(
            child: new Text("OK", style: TextStyle(color: Colors.green[800])),
            onPressed: () {
              int count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
            },
          ),
        ],
      );
    },
  );
}

void _showErrorDialog() {
  showDialog(
    context: _scaffoldKey.currentContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Medicine entry status:",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green[800])),
        content: new Text("PLEASE ENTER DATA CORRECTLY!",
            textAlign: TextAlign.center),
        actions: <Widget>[
          new TextButton(
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
