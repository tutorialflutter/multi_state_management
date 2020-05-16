import 'package:apk_state/mycart.dart';
import 'package:apk_state/mymoney.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MyCart>(
            create: (context) => MyCart(),
          ),
          ChangeNotifierProvider<MyMoney>(
            create: (context) => MyMoney(),
          ),
        ],
        child: Scaffold(
          floatingActionButton: Consumer<MyMoney>(
            builder: (context, mymoney, _) => Consumer<MyCart>(
              builder: (context, mycart, _) => FloatingActionButton(
                onPressed: () {
                  if (mymoney.balance > 0) {
                    mymoney.balance -= 500;
                    mycart.quantity += 1;
                  }
                },
                child: Icon(
                  Icons.add_shopping_cart,
                ),
                backgroundColor: Colors.purple,
              ),
            ),
          ),
          appBar: AppBar(
            title: Text("Apk State Mngt Multi Provider"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Saldo"),
                    Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Consumer<MyMoney>(
                            builder: (context, mymoney, _) => Text(
                                mymoney.balance.toString(),
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          )),
                      width: 150,
                      height: 30,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Consumer<MyCart>(
                    builder: (context, mycart, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Apple (500) x " + mycart.quantity.toString()),
                        Text((500 * mycart.quantity).toString())
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Money {}
