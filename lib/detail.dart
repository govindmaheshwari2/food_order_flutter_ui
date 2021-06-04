import 'package:flutter/material.dart';
import 'package:food_order_tutorial/database.dart';
import 'package:food_order_tutorial/readmore.dart';

class Detail extends StatefulWidget {
  final Item item;
  Detail(this.item);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFF1F1),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFFFF1F1),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFFFF1F1),
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                  onPressed: () => print("favorite"),
                  icon: Icon(Icons.favorite_outline))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.item.name,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("\$ " + widget.item.price,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: Image(image: AssetImage(widget.item.image)),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (quantity > 1) quantity -= 1;
                        });
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.horizontal_rule,
                            size: 16, color: Colors.black),
                        radius: 16,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(quantity.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity += 1;
                        });
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.add, size: 16, color: Colors.white),
                        radius: 16,
                        backgroundColor: Colors.red,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star_border),
                        SizedBox(
                          width: 5,
                        ),
                        Text(widget.item.rating)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.fastfood_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(widget.item.cal)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(
                          width: 5,
                        ),
                        Text(widget.item.time)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ReadMoreText(
                    widget.item.detail,
                    trimLines: 3,
                    colorClickableText: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total x" + quantity.toString(),
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "\$" +
                                (int.parse(widget.item.price) * quantity)
                                    .toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
