
import 'package:flutter/material.dart';

import '../models/Strings.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();

}
class _homepageState extends State<homepage> {

  List<Map<String, String>> cartItems = [];

  void _showAddBottomSheet(int index) {
    cartItems.add({
      'name': names[index],
      'amount': amount[index],
    });

    showModalBottomSheet(
      backgroundColor: Colors.greenAccent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int sheetIndex) {
                return ListTile(
                  title: Text(cartItems[sheetIndex]['name']!),
                  subtitle: Text(cartItems[sheetIndex]['amount']!),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cartItems.removeAt(sheetIndex); // Remove item from the list
                      });
                    },
                    child: Text('Remove'),
                  ),
                );
              },
            );
          },
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