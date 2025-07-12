import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  final String title;
  final void Function()? onPressedSearchIcon;
  final TextEditingController? mycontroller;
  final void Function()? onPressedFavorite;

  final Function(String)? onChanged;

  const AppBarHome(
      {super.key,
      required this.title,
       this.mycontroller,
      required this.onPressedSearchIcon,
     
      required this.onPressedFavorite,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                prefixIcon:
                    IconButton(onPressed: onPressedSearchIcon, icon: Icon(Icons.search)),
                hintText: title,
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          Container(
            child: IconButton(
              onPressed: () {
                
              },
                icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                  color: Colors.grey,
                )),
          ),
          Container(
            child: IconButton(
                onPressed: onPressedFavorite,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: Colors.grey,
                )),
          )
        ],
      ),
    );
  }
}
