import 'package:flutter/material.dart';
import 'package:circular_motion/circular_motion.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> imagesUrl = [
    'assets/images/supermarket.png',
    'assets/images/drinks.png',
    'assets/images/scooter.png',
    'assets/images/bandage.png',
    'assets/images/food.png',
  ];
  List<String> imagesDescription = [
    'Supermarket',
    'Glovo Party',
    'Delivery Express',
    'Health, baby & beauty',
    'Restaurant',
  ];
  Color mycolor = const Color(0xffFDC346);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Motion',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.person_outline_rounded,
                color: Colors.white,
              ),
              Row(
                children: const [
                  Text('Glovo Head Quarters'),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
              const Icon(Icons.share),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xffFDC346),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'What can we get you?',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 1.0,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 390,
                  height: 390,
                  child: SafeArea(
                    // Here's is the magic.
                    child: CircularMotion(
                      behavior: HitTestBehavior.translucent,
                      centerWidget: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/wand.png',
                                width: 100.0,
                                height: 100,
                              ),
                              Container(
                               transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                                child: const Text(
                                  'Anything',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      children: List.generate(
                        5,
                        (index) {
                          return Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              //color: Colors.primaries[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imagesUrl[index],
                                    height: 70.0,
                                    width: 70.0,
                                  ),
                                  Text(
                                    imagesDescription[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(350.0),
                  topRight: Radius.circular(350.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Icon(
                    Icons.location_pin,
                    size: 40.0,
                    color: mycolor,
                  ),
                  Text(
                    'Your glovos',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: mycolor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
