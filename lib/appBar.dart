import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredwidget = 80.0;
  final String title;
  final Color gradientBegin, gradientEnd;
  final Widget button;
  CustomAppBar({this.title, this.gradientBegin, this.gradientEnd, this.button});
    @override
  
  Size get preferredSize => Size.fromHeight(_preferredwidget);
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Stack(children: <Widget>[
        Container(
          height: _preferredwidget,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(1.0, 1.0),
                    spreadRadius: 1.0,
                    blurRadius: 5.0,
                    color: Colors.black38)
              ],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0))),
        ),
        Container(
          height: _preferredwidget,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              gradient:
                  LinearGradient(colors: <Color>[gradientBegin, gradientEnd])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(title,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        )),
              ),
              Padding(padding: const EdgeInsets.only(left: 8.0), child: button)
            ],
          ),
        ),
      ]),
    );
  }



}