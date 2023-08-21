import 'package:flutter/material.dart';
import 'dataButton.dart';

class ButtonProfile extends StatelessWidget {

  final DataButton dataButton;
  ButtonProfile(this.dataButton);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                dataButton.icon1,
                color: Color(0xff025464),
              ),
              SizedBox(
                width: 24,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataButton.text1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    dataButton.text2,
                    style: TextStyle(
                        color: Colors.cyan.shade800,
                        fontSize: 9,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            dataButton.icon2,
            color: Color(0xff025464),
          ),
        ],
      ),
    );
  }
}
