import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductSearchPage extends StatefulWidget {
  final String searchKeyword;
  const ProductSearchPage({super.key, required this.searchKeyword});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "HOME",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white70,
        actions: [
          Icon(
            Icons.add_shopping_cart_sharp,
            color: Colors.black,
          )
        ],
        bottom: PreferredSize(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Search By "${widget.searchKeyword}"',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )),
          ),
          preferredSize: Size(40, 40),
        ),
      ),
      body: Container(
        color: Colors.white70,
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
          SizedBox(
            height: 30,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 20,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Icon(Icons.favorite_border),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/s6.png",
                                height: 100,
                              ),
                            )
                          ],
                        ),
                        Text("Nike Shoes"),
                        Row(
                          children: [
                            Text("\$70"),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff5682E4),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
