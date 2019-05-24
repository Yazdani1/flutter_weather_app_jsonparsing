import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() async{

  Map data=await getAllData();
  
  print("Result is:"+data['city']['coord']['lat'].toString());

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Weather Application"),
        backgroundColor: Colors.deepOrange,
      ),

      body: new Container(
        height: 800.0,
        child: new Stack(
          children: <Widget>[

            new Container(
              height: 800.0,
              child: new Image(
                  image: AssetImage("asset/sun.jpg"),
                fit: BoxFit.cover,
              ),
            ),

            new Positioned(
                bottom: 50.0,
              child: new Container(
                height: 100.0,
                margin: EdgeInsets.all(10.0),
                width: 400.0,
                color: Colors.deepOrange,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(data['list'][0]['main']['temp'].toString()+"/F",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    ),
                    ),
                    new SizedBox(height: 10.0,),

                    new Text(data['list'][0]['weather'][0]['main'],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),
                    ),


                  ],
                ),
              ),
            )

          ],
        ),
      ),

    ),
  ));
}

Future<Map> getAllData() async{

  var api="https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=b6907d289e10d714a6e88b30761fae22";

  var data=await http.get(api);

  var jsonData=json.decode(data.body);

  return jsonData;
}

