import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/sof.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Button'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                /*onPressed: () {
                  print("RaisedButton");
                },*/
                 onPressed: () async {
            List<MedEntry> meds = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SOF(),
                
              ),
            );
            
            if (meds != null) meds.forEach(print);
          },
        
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "Add Admin Entries",//Name of Button
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
             SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                onPressed: () {
                  print("RaisedButton");
                },
                /* onPressed: () async {
            List<MedEntry> meds = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SOF(),
                
              ),
            );
            
            if (meds != null) meds.forEach(print);
          },*/
        
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "Add Pharmacy Store",//Name of Button
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
           
          
          ],
        ),
      ),
      
    );
  }
}