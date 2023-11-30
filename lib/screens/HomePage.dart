
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
      backgroundColor: Colors.indigo[200],
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ListView.builder(
              itemCount: cartItems.length + 1, // Additional item for the Cart button
              itemBuilder: (BuildContext context, int sheetIndex) {
                if (sheetIndex == cartItems.length) {
                  // Display a "Cart" button at the end of the list
                  return Container(

                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.pop(context);
                        _viewCart();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                        backgroundColor: Colors.green, // Change button color here
                      ),

                      child: Text('View Cart', style: TextStyle(fontSize: 16.0,)),
                    ),
                  );
                } else {
                  // Display added items in the list
                  return ListTile(
                    title: Text(cartItems[sheetIndex]['name']!),
                    subtitle: Text(cartItems[sheetIndex]['amount']!),
                    trailing: OutlinedButton(  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                      onPressed: () {
                        setState(() {
                          cartItems.removeAt(sheetIndex); // Remove item from the list
                        });
                      },
                      child: Text('Remove',
                      style:TextStyle(color: Colors.black) ,),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  void _viewCart() {
    // Code to navigate to the cart page or show cart details
    // You can implement navigation or show a dialog with cart items here
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