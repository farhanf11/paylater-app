import 'package:flutter/material.dart';

class TkbCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00B2D3), Colors.orangeAccent],
        ),
      ),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('98,50%',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color:Colors.white ),
                ),
                Icon(Icons.info_outline, color: Colors.white,)
              ],
            ),
            SizedBox(height: 5,),
            Text('TKB90',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color:Colors.white,),
            ),
          ],
        ),
      ),
    );
  }

}