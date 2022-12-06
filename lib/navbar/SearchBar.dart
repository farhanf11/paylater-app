import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 2.5),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0.8)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 0.8, color: Theme.of(context).primaryColor)
                    ),
                    hintText: "Search Flutter Hope",
                    prefixIcon: const Icon(Icons.search, size: 20,),
                    suffixIcon: IconButton(icon: const Icon(Icons.clear), onPressed: (){})
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}