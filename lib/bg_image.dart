import 'package:flutter/material.dart';


class BgImage extends StatelessWidget {
  const BgImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.asset("assets/photo1.jpg",
            fit:BoxFit.cover);
  }
}