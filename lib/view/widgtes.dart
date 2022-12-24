import 'package:flutter/material.dart';

customtxtfld(controller){
  return  TextField(
  controller: controller,
    decoration:InputDecoration(
border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(
  width: 10
)),
focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
 

    ),
  );
}

customtext(txt){
return  Text(txt, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),);
}


