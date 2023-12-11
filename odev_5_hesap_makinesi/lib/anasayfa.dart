import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    double ekranYuksekligi = ekranBilgisi.size.height;
    double ekranGenisligi = ekranBilgisi.size.width;
    print(ekranGenisligi);
    print(ekranYuksekligi);

    double? evaluateExpression(String expression) {
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        return exp.evaluate(EvaluationType.REAL, cm);
      } catch (e) {
        print("Hata: $e");
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Makinesi"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.calculate_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 200, bottom: 20, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(hintText: "Değerleri giriniz"),
                controller: tfController,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "7";
                    },
                    child: Text("7"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "8";
                    },
                    child: Text("8"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "9";
                    },
                    child: Text("9"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "-";
                    },
                    child: Text("-"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "4";
                    },
                    child: Text("4"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "5";
                    },
                    child: Text("5"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "6";
                    },
                    child: Text("6"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "+";
                    },
                    child: Text("+"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "1";
                    },
                    child: Text("1"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "2";
                    },
                    child: Text("2"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      tfController.text += "3";
                    },
                    child: Text("3"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                    onPressed: () {
                      String result = tfController.text;
                      double evalResult = evaluateExpression(result)!;
                      if (evalResult != null) {
                        tfController.text = evalResult.toString();
                      } else {
                        // Hata durumunda ekrana hata mesajı verebilirsiniz
                        tfController.text = "Hata";
                      }
                    },
                    child: Text(" = "),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 432,
                  child: ElevatedButton(
                    onPressed: () {
                      tfController.text = "";
                    },
                    child: Text("CLEAR"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
