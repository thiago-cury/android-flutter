import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageCrontoller;
  final int page;

  DrawerTile(this.icon, this.text, this.pageCrontoller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          pageCrontoller.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(icon,
              size: 32.0,
              color: pageCrontoller.page.round() == page ?
                Theme.of(context).primaryColor : Colors.grey[700],
              ),
              SizedBox(width: 32.0,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
