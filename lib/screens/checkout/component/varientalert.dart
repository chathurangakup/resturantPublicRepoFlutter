import 'package:flutter/material.dart';

class VarientAlert extends StatelessWidget{
  final String varientname;
  final String varientprice;

  const VarientAlert({
    Key key,
    this.varientname,
    this.varientprice,
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SingleChildScrollView(
      child: Row(
        children: <Widget>[
          new Expanded (
            flex:2,
            child : Column(
              children: <Widget>[new Text(varientname)],
            ),),
          new Expanded (
            flex:1,
            child : Column(
              children: <Widget>[new Text(varientprice)],
            ),),
        ],
      ),
    );

  }

}