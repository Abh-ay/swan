import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:swan/model/search_model.dart';
import 'package:http/http.dart' as http;


class Palete {
 static Color? grey=Colors.grey[200];
  static Color? cyan= Colors.cyan[600];
}
class Reusable{
static text(String text,{double? fontsize,TextAlign? textAlign}){
  return Text(text,
  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: fontsize??20,),
  textAlign: textAlign,);
}
static textGrey(String text,{double? fontsize}){
  return Text(text,style:  TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize:fontsize??20),);
}
static textField(String string,{TextEditingController? controller,Function(String)? focus,FocusNode? focusNode}){
  return  
     SizedBox(
       height: 50,
       child: TextField(
         onSubmitted: focus,
         focusNode: focusNode,
         controller: controller,
         style: const TextStyle(fontSize: 18),
                          decoration:
                         InputDecoration(hintText: string,
                         
                         
                         
                         focusedBorder:const OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 1.0)),
                         border:const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.0)),
                         hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w300),)),
     );
  
}
}