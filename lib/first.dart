import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class first extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    String Submit = "0";

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: ChangeNotifierProvider(
          create: (context) => Model(),
          child: Consumer<Model>(
            builder: (context, value, child) {
              return Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: value.t1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter Number"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: value.t2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter Number"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(children: [
                        ElevatedButton(
                            onPressed: () {
                              //String first = t1.text;
                              //t2.text = first;
                              value.sum();
                            },
                            child: Text("+")),
                        ElevatedButton(
                            onPressed: () {
                              // String first = t1.text;
                              //t2.text = first;
                              value.sub();
                            },
                            child: Text("-")),
                        ElevatedButton(
                            onPressed: () {

                              value.mul();
                            },
                            child: Text("x")),
                        ElevatedButton(
                            onPressed: () {

                              value.div();
                            },
                            child: Text("/")),
                        ElevatedButton(
                            onPressed: () {

                              value.per();
                            },
                            child: Text("%")),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Result:",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "${value.Submit}",
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    )
                  ]);
            },
          )),
    );
  }
}

class Model extends ChangeNotifier {
  //int cnt= 0;

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  double? Submit;

  void sum() {
    Submit = double.parse(t1.text) + double.parse(t2.text);
    notifyListeners();
  }

  void sub()
  {
    Submit = double.parse(t1.text) - double.parse(t2.text);

    notifyListeners();
  }

  void mul()
  {
    Submit = double.parse(t1.text) * double.parse(t2.text);

    notifyListeners();
  }

  void div()
  {
    Submit  = double.parse(t1.text) / double.parse(t2.text);

    notifyListeners();
  }

  void per()
  {
    Submit  = double.parse(t1.text) % double.parse(t2.text);

    notifyListeners();
  }



}





