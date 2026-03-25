import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required TextEditingController seachController,
  }) : _seachController = seachController;

  final TextEditingController _seachController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: SearchBar(
           padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical : 0,horizontal: 10)),
           controller: _seachController,
           leading: Icon(Icons.search),
           hintText: "Quel service recherchez vous ??",
           hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
         ),
    );
  }
}