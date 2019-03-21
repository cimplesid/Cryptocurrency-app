import 'package:flutter/material.dart';
import './about.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';
class HomePage extends StatelessWidget {
  @override
  Future<List> getCurrencies() async {
    http.Response res =
        await http.Client().get('https://api.coinlore.com/api/tickers/');
    return json.decode(res.body)['data'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("CryptoCurrency"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
             Navigator.pushReplacement(

                        context, MaterialPageRoute(builder: (_) => About(sid)));

                
            },
          )
        ],
      ),
      body: Container(
        //color: Colors.green,
        child: FutureBuilder(
          future: getCurrencies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (snapshot.hasError)
              return Center(
                child: Text("error"),
              );
            List data = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                Coin coin = Coin.fromMap(data[index]);
                return Card(
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                    child: ListTile(
                      title: Text(
                        coin.name,
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "\$${coin.priceUSD}",
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      subtitle: //
                          Text(
                        coin.symbol,
                        style: TextStyle(color: Colors.white30),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  static final DEV sid = DEV(
    firstName: 'Cimple',
    lastName: 'Sid',
    avatar: 'assets/avatar.png',
    backdropPhoto: 'assets/backdrop.png',
    location: 'Mahendranagar, Nepal',
    biography: 'Siddhartha "sid" Joshi is a tech guy  '
        'he also run the youtube channel and is also a web developer  '
        'he have high interest in this field and now training himself as a flutter developer check out my youtube channel some of the videos are linked below',
    videos: <Video>[
      Video(
        title: 'WIFI hacking part 1',
        thumbnail: 'assets/video1_thumb.png',
        url: 'https://www.youtube.com/watch?v=06qoTsKYWKE',
      ),
      Video(
        title: 'WIFI hacking part 2',
        thumbnail: 'assets/video2_thumb.png',
        url: 'https://www.youtube.com/watch?v=3XG4c5_mGCM',
      ),
      Video(
        title: 'WIFI hacking part 3',
        thumbnail: 'assets/video3_thumb.png',
        url: 'https://www.youtube.com/watch?v=C29QstsxWQE',
      ),
      Video(
        title: 'Find facebook users location',
        thumbnail: 'assets/video4_thumb.png',
        url: 'https://www.youtube.com/watch?v=J9zhKtL_gH0',
      ),
    ],
  );
}

class Coin {
  String id;
  String name;
  String symbol;
  String priceUSD;
  //double rank ;

  Coin.fromMap(Map data)
      : id = data['id'],
        name = data['name'],
        symbol = data['symbol'],
        priceUSD = data['price_usd'];
}
