import 'package:flutter/material.dart';
import 'package:jenga/data/color_scheme.dart';

class BaseButton extends StatelessWidget{
  
  BaseButton({this.child, this.action, this.width, this.height, this.padding, this.margin});
  
  final Widget child;
  final Function action;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final width;
  final height;


  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: JengaColorScheme.primaryOrange,
            spreadRadius: 0.9,
            blurRadius: 10.0,
          )
        ]
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        color: JengaColorScheme.primaryOrange,
        child: Padding(
          padding: padding,
          child: child,
        ),
        onPressed: action,
      ),
    );
  }
}