import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopapp/pages/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double currentIndex = 0;

  List<IntroModel> introdata = [
    IntroModel(image: "assets/s1.png", text: "Follow the latest style"),
    IntroModel(image: "assets/s2.png", text: "Select your fevroite shoes"),
    IntroModel(image: "assets/s3.png", text: "Get multiple choice"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Center(child: Text("Get Start"))),
          ),
        ),
      ),
      backgroundColor: Color(0xff5380E5),
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: -200,
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff6193FF),
              ),
            )),
        PageView.builder(
          itemCount: introdata.length,
          onPageChanged: (v) {
            currentIndex = v.toDouble();
            setState(() {});
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(
                  introdata[index].image,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 200,
                ),
                DotsIndicator(
                  dotsCount: 3,
                  position: currentIndex,
                  decorator: DotsDecorator(activeColor: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  introdata[index].text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        )
      ]),
    );
  }
}

class IntroModel {
  final String image;
  final String text;
  IntroModel({required this.image, required this.text});
}
