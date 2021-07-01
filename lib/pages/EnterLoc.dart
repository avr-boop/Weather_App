import 'package:flutter/material.dart';

class EnterLoc extends StatefulWidget {
  const EnterLoc({Key? key}) : super(key: key);

  @override
  _EnterLocState createState() => _EnterLocState();
}

class _EnterLocState extends State<EnterLoc> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [Colors.white, Colors.blue])),
                    child: Column(
                      children: [
                        SizedBox(height: 250),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              obscureText: false,
                              controller: myController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                labelText: "Enter your city",
                                labelStyle: TextStyle(color: Colors.black87),
                                hintText:
                                    'Please enter City name without spelling error',
                              )),
                        ),
                      ],
                    )))));
  }
}
