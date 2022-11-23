import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopapp/pages/third_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.shopping_cart)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.center,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        icons: [Icons.home, Icons.card_giftcard, Icons.favorite, Icons.person],
        onTap: (p0) {},
        activeIndex: 0,
      ),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "HOME",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white70,
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.black,
          )
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search here...",
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade500))),
                  onSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductSearchPage(searchKeyword: value),
                        ));
                  },
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                )),
              ),
            ]),
          ),
          preferredSize: Size(70, 70),
        ),
      ),
      body: Container(
        color: Colors.white70,
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                    colors: [Color(0xff9BB8F9), Colors.blue.shade900])),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Color(0xff648DE3),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Up to",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "70%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Spacial discount",
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Image.asset(
                "assets/s6.png",
                height: 150,
              ))
            ]),
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
