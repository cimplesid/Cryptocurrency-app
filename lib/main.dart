import 'package:flutter/material.dart';
// import './home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'http req',
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Future<List> getCurrencies()async{
    http.Response res =await http.Client().get('https://api.coinlore.com/api/tickers/');
    return json.decode(res.body)['data'];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Crypto currency'),
        actions: <Widget>[
        
          // IconButton(
          //   icon: Icon(Icons.arrow_downward),
          //   onPressed: (){print('pressed');},
          // )
        ],

      ),
    body: Container(
      color: Colors.green,
      child: FutureBuilder(
        future: getCurrencies(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
          if(snapshot.hasError) return Center(child: Text("error"),);
          List data =snapshot.data;
          return ListView.builder(
            itemCount:  data.length,
            itemBuilder: (BuildContext context,int index){
              Coin coin =Coin.fromMap(data[index]);
              return ListTile(
                title: Text(coin.name),
                trailing: Text("\$${coin.priceUSD}"),
                subtitle: Text(coin.symbol),
              );
            },
          );
        },
      ),
    ),
      
    );
  }
}

class Coin {
  String id;
  String name;
  String symbol;
  String priceUSD;
  
  Coin.fromMap(Map data):
  id=data['id'],
  name=data['name'],
  symbol=data['symbol'],
  priceUSD=data['price_usd'];

}