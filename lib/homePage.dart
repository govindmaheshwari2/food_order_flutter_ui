import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order_tutorial/database.dart';
import 'package:food_order_tutorial/detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> currentItem = categoryList[0].items;
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1F1),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "eats",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.shopping_cart_outlined, size: 30)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Flexible(
                        child: TextField(
                      autofocus: false,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          hintText: "Search"),
                    )),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.sort, size: 40, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        currentItem = categoryList[index].items;
                        categoryIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.grey,
                                  spreadRadius: 1)
                            ]),
                        child: CircleAvatar(
                          backgroundColor: categoryIndex == index
                              ? Colors.red
                              : Colors.white,
                          radius: 30,
                          child: SvgPicture.asset(
                            categoryList[index].image,
                            color: categoryIndex == index
                                ? Colors.white
                                : Colors.grey,
                            fit: BoxFit.fill,
                            height: 30,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 210,
                child: ShowItems(currentItem),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 140,
                child: ShowCategory(name: "Best Seller", item: currentItem),
              ),
              SizedBox(height: 15),
              Container(
                child: AllProduct(name: "All Product", item: currentItem),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShowItems extends StatelessWidget {
  final List<Item> items;
  ShowItems(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return showProduct(items[index], context);
      },
    );
  }
}

class ShowCategory extends StatelessWidget {
  final String name;
  final List<Item> item;
  ShowCategory({required this.name, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        Flexible(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: item.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(item[index])));
              },
              child: Container(
                width: 260,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: Colors.grey, spreadRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        child: Image(image: AssetImage(item[index].image))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 150,
                                child: Text(item[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))),
                            Text("\$" + item[index].price,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18))
                          ],
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 15,
                            child: Icon(Icons.add, color: Colors.white))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ))
      ],
    );
  }
}

class AllProduct extends StatelessWidget {
  final String name;
  final List<Item> item;
  AllProduct({required this.name, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          child: Text(name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        Flexible(
            child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: item.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) {
            return showProduct(item[index], context);
          },
        ))
      ],
    );
  }
}

Widget showProduct(Item item, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Detail(item)));
    },
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 170,
              width: 150,
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$" + item.price,
                            style: TextStyle(color: Colors.grey, fontSize: 18)),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 20,
                          child: Icon(Icons.add, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
        Positioned(
            left: 0,
            right: 0,
            child: Container(
                height: 100,
                child: Image(
                  image: AssetImage(item.image),
                )))
      ],
    ),
  );
}
