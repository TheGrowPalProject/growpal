import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growpal_hackathon/globalVariables.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);
  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  var quantities = [1,1,1,1,1,1,1];
  var titles = ["Hand Bag", "Earring", "Tupperware Box", "Cable Protectors", "Bottle", "Phone Case", "Stickers"];
  var prices = [999, 199, 499, 99, 599, 299, 49];
  var price = 2743;
  var skipIndexes = [];



  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        for(int i = 1; i < 8; i++)
          if (!skipIndexes.contains(i-1))
          Container(
              height: 110,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Radio(
                    value: "",
                    groupValue: "",
                    activeColor: Color(0xFF4C53A5),
                    onChanged: (index) {},
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 15),
                    child: Image.asset("images/image$i.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${titles[i - 1]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                        Text(
                          "₹${prices[i - 1] * quantities[i - 1]}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onTap: () {
                              setState(() {
                                skipIndexes.add(i-1);
                                quantities[i-1] = 0;
                                prices[i-1] = 0;
                                price =  quantities[0]*prices[0] +
                                    quantities[1]*prices[1] +
                                    quantities[2]+prices[2] +
                                    quantities[3]*prices[3] +
                                    quantities[4]*prices[4] +
                                    quantities[5]*prices[5] +
                                    quantities[6]*prices[6];
                                if (price == 0){
                                  globalVariables().checkoutPermit = false;
                                }
                              });
                            }
                          ),
                          Row(
                            children: [
                              InkWell(

                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                      ]
                                  ),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                  ),

                                ),
                                onTap: () {
                                  setState(() {
                                    if (quantities[i - 1] > 1) {
                                      quantities[i - 1] -= 1;
                                      price =  quantities[0]*prices[0] +
                                          quantities[1]*prices[1] +
                                          quantities[2]+prices[2] +
                                          quantities[3]*prices[3] +
                                          quantities[4]*prices[4] +
                                          quantities[5]*prices[5] +
                                          quantities[6]*prices[6];
                                      if (price == 0){
                                        globalVariables().checkoutPermit = false;
                                      }

                                    }
                                  }
                                  );
                                },
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "${quantities[i - 1]}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5),
                                  ),

                                ),
                              ),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                      ]
                                  ),
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    size: 18,
                                  ),


                                ),
                                onTap: () {
                                  setState(() {
                                    quantities[i - 1] += 1;
                                    price =  quantities[0]*prices[0] +
                                        quantities[1]*prices[1] +
                                        quantities[2]+prices[2] +
                                        quantities[3]*prices[3] +
                                        quantities[4]*prices[4] +
                                        quantities[5]*prices[5] +
                                        quantities[6]*prices[6];
                                    if (price == 0){
                                      globalVariables().checkoutPermit = false;
                                    }
                                    //setPrice(price);

                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              )
          ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                "Total: ",
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 18),
              child: Text(
                "₹${price}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),


                ),

              ),
            ),
          ],
        ),

      ],



    );
  }



}
