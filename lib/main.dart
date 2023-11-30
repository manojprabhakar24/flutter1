import 'package:flutter/material.dart';

import 'screens/HomePage.dart';


void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
        home: Scaffold(

          body: Column(
              children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(20, 10, 10, 5)),

                    Image.network("data:image/png;base64,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"
                    ),
                  ],

                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10)),
                    Text("Secissor's",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 280)),
                    Text("Services", style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold,
                        color: Colors.indigo),)
                  ],
                ),
                Expanded(child: homepage(),),
              ]),
        ));
  }
}




