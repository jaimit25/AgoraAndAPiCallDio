import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WebSup extends StatefulWidget {
  @override
  State<WebSup> createState() => _WebSupState();
}

class _WebSupState extends State<WebSup> {
  var url = "https://jsonplaceholder.typicode.com/posts";
  dynamic data = [];
  getD() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("${response.body}");
      // var jsonResponse =
      //     convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var jsonResponse =
      //     convert.jsonDecode(response.body) as DYNAMIC;

      print('${response.body}');
      setState(() {
        var jsonResponse = convert.jsonDecode(response.body) as List;
        data = jsonResponse;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  postD() async {
    print("ran");

    try {
      var response = await http.post(Uri.parse(url), body: {
        "title": "Dart",
        "body": "Dart is awesome",
        "userId":"10",
      }).catchError((e) {
        print(e);
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
    print("Executed");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getD();
  }

  var des = TextStyle(
    color: Colors.black,
    fontSize: 90,
    fontWeight: FontWeight.bold,
  );
  var desw = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
  var desbw = TextStyle(
    color: Colors.white,
    fontSize: 13,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          actions: [
            InkWell(
                onTap: () {
                  print("clicked");
                  postD();
                },
                child: Icon(Icons.add)),
            InkWell(
                onTap: () {
                  getD();
                },
                child: Icon(Icons.refresh))
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      // tileColor: Colors.yellow,
                      title: Text(data[index]['title'], style: desw),
                      subtitle: Text(data[index]['body'], style: desbw),
                      iconColor: Colors.grey,
                      leading: Text(
                        "id : " + data[index]['id'].toString(),
                        style: desbw,
                      ),
                      // leading: Icon(Icons.person,size: 30,),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
