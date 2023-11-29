import 'package:flutter/material.dart';

import 'myimage.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}
class _homepageState extends State<homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount:imageUrls.length,
        itemBuilder: (BuildContext context,int index)=>Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50,
                            width: 50,

                            child: Image.network(imageUrls[index]),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),

                            Text(names[index],style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.fromLTRB(10, 30, 0, 0)),
                            Text(amount[index],style: TextStyle(color: Colors.black,fontSize:12,),),
                            Text(description[index],style: TextStyle(color: Colors.black,fontSize:9,),),
                          ],
                        )

                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      child: OutlinedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white)),
                        onPressed: () {  }, child: Text("Add",
                          style: TextStyle(color: Colors.deepPurpleAccent),

                        ),
                      ),

                    ),

                  ],

                ),
              ),
            ),
          )
      ),
    );
  }
}
//data:image/jpeg;base64,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
//data:image/jpeg;base64,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
//https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSddZ7wB18rA63NUq05plObprDGRiVTKEWEYCo9fzOm&s