import 'package:flutter/material.dart';

import 'bg_image.dart';



class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key? key,
    required this.myText,
    required TextEditingController nameController,
  }) : _nameController = nameController, super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     BgImage(),
      const SizedBox(
        height: 20,
      ),
      Text(
        myText,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
      ),
      const SizedBox(
        height: 20,
      ),
         Padding(
          padding: EdgeInsets.all(16.0),
          child:
          TextField(
            controller: _nameController,
            // obscureText: true,
            decoration: 
            InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Something here",
              labelText: "Name",
              ),
          )
        )
    ],);
  }
}
