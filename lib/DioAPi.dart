import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Dio_try extends StatefulWidget {
  @override
  State<Dio_try> createState() => _Dio_tryState();
}

class _Dio_tryState extends State<Dio_try> {
  dynamic dta;

  getData() async {
    try {
      var client = await Dio();
      var response =
          await client.get("https://mock-database-f1298.web.app/api/v1/users");
      if (response.statusCode == 200) {
        print("Success");
        print(response.data);
        print(response.data["users"][1]["name"]);

        setState(() {
          dta = response.data;
        });
      } else
        print(response.statusCode);
    } catch (e) {
      print("$e");
    }
  }

  @override
  void initState() {
    getData();
  }

  postData() {
    // var client = Dio();
    // client.post("https://mock-database-f1298.web.app/api/v1/users",
    //     onSendProgress: (int sent, int total) {
    //   print('$sent $total');
    // }, 
    // options: Options(
    //   contentType: Headers.formUrlEncodedContentType,
    //   responseType: ResponseType.json,
    // ),
    // data: {
    //   "images": [
    //     {
    //       "name": "Mountain",
    //       "image":
    //           "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80",
    //     },
    //     {
    //       "name": "Cyclist",
    //       "image":
    //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZYdiS6o83xt08rKMnams6WzHDiETtxkYcTg&usqp=CAU",
    //     },
    //     {
    //       "name": "Boat",
    //       "image":
    //           "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__340.jpg",
    //     },
    //     {
    //       "name": "Car",
    //       "image":
    //           "https://www.drivespark.com/images/2021-03/volvo-c40-recharge-17.jpg",
    //     }
    //   ]
    // });
  }

  var des = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                getData();
              },
              child: Text("get DAta"),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                postData();
              },
              child: Text("Post DAta"),
            ),
          ),
          Container(
            height: 500,
            color: Colors.green,
            child: ListView.builder(
              itemCount: dta["users"].length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                print(dta["users"].length);
                return Container(
                  height: 40,
                  color: Colors.pink,
                  child: Text(dta["users"][index]["name"], style: des),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
