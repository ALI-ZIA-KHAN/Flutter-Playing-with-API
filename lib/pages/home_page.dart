import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../drawer.dart';



class Homepage  extends StatefulWidget {
  const Homepage ({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


TextEditingController _nameController= TextEditingController();
var myText="Change Me";


var url= Uri.parse("https://jsonplaceholder.typicode.com/photos");
var data;

@override

 void initState(){
   super.initState();
  getData();

 }

getData() async{
  var res =await http.get(url);
  //  print(res.body);
  data=jsonDecode(res.body);
  print(data);
  setState(() {
    
  });
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        title:const Text("Awesome App")
      ),
      body: Padding(
      padding: const EdgeInsets.all(16),
       child: data != null 
      ?  ListView.builder(



        // ?GridView.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
        //   (
        //   crossAxisCount:2
        //   ),
         



        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title:Text(data[index]["title"]),
              subtitle: Text("ID: ${data[index]["id"]}"),
              leading:Image.network(data[index]["thumbnailUrl"]),
            ),
          );
        },
        itemCount:data.length)
      : Center
        (
          child:CircularProgressIndicator(),
          )
        ),
      
      
      drawer:MyDrawer(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: FloatingActionButton(
         onPressed: (){
           myText=_nameController.text;
           setState(() {
             
           });
         },
       child: const Icon(Icons.refresh
       )
       ),  
      );
  }
}

