import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/ProdAppBar.dart';
import '../widgets/ProdBottomNaviBar.dart';


class ProdPage extends StatefulWidget {


  const ProdPage({Key? key}) : super(key: key);

  @override
  State<ProdPage> createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  var quantity = 1;
  @override
  Widget build(BuildContext context) {

    List<Color> clrs = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.pinkAccent,
    ];
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ProdAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset("images/image1.png", height: 300),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 48,
                          bottom: 15),

                      child: Row(
                        children: [
                          Text(
                            "Product Title",
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Color(0xFF4C53A5),
                            ),
                            onRatingUpdate: (index) {},

                          ),
                          Row(
                            children: [
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 20,
                                        offset: Offset(0, 3),
                                      )
                                    ]
                                  ),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Color(0xFF4C53A5),
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    if(quantity>1) {
                                      quantity -= 1;
                                    }
                                  });
                                },
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "$quantity",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 20,
                                          offset: Offset(0, 3),
                                        )
                                      ]
                                  ),
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    size: 18,
                                    color: Color(0xFF4C53A5),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    quantity += 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "Size:  ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          SizedBox(width: 10,),
                          Row(
                            children: [
                              for(int i = 5; i < 10; i++)
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                  ],

                                ),
                                child: Text(
                                  "$i",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "Color:",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          SizedBox(width: 10,),
                          Row(
                            children: [
                              for(int i = 0; i < 5; i++)
                                Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: clrs[i],
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                        ),
                                      ],

                                    ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),


        ],

      ),
      bottomNavigationBar: ProdBottomNaviBar(),

    );
  }
}
