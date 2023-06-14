import 'package:flutter/material.dart';
import 'package:paylater/user/KategoriPage.dart';
import '../models/categories.dart';

class CardCategories extends StatelessWidget{

  final Categories categories;
  CardCategories(this.categories);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        height: 45,
        width: 90,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(categories.imageUrl)),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(categories.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color:Colors.white,),
              ),
            ],
          ),
        ),
      ),

      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => KategoriPage())),
    );
  }

}