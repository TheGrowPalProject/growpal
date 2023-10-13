import 'package:flutter/material.dart';


class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arr = ["Hand Bags", "Earrings", "Tupperware Box", "Cable Protectors", "Tupperware Bottles", "Phone Cases", "Stickers", "Papads"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 1; i< 9; i++)
          Container(
            color: Colors.black,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            // decoration: BoxDecoration(
            //   color: Colors.black,
            //   borderRadius: BorderRadius.circular(20),
            // ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/image$i.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  "${arr[i-1]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFF4C53A5),/**/
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
