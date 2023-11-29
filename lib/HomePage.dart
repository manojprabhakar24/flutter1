import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Strings.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}
class _homepageState extends State<homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            ListView.builder(
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
          ]
      ),
    );
  }


}