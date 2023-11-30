
import 'package:flutter/material.dart';

import '../models/Strings.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();

}
class _homepageState extends State<homepage> {
  void _showAddBottomSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Item Details'),
              SizedBox(height: 16.0),
              Text('Name: ${names[index]}'),
              SizedBox(height: 8.0),
              Text('Amount: ${amount[index]}'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            ListView.builder(

                itemCount:imageUrls.length,
                itemBuilder: (BuildContext context,int index)=>Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 150,
                                width: 150,


                                child: Image.network(imageUrls[index]
                                ),

                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget> [
                                  Padding(padding: EdgeInsets.all(8)),

                                  Text(names[index],style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),),
                                  Padding(padding: EdgeInsets.all(20)),
                                  Text(amount[index],style: TextStyle(color: Colors.black,fontSize:12,),),
                                  Padding(padding: EdgeInsets.all(30)),

                                  Text(description[index],style: TextStyle(color: Colors.black,fontSize:9,),),
                                ],
                              )

                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(55),
                            child: OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              ),
                              onPressed: () {
                                _showAddBottomSheet(index); // Pass the index to display the bottom sheet with ListView
                              },
                              child: Text(
                                "Add",
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