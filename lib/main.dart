import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState((){
      count--;
    });
    print(count);
  }

  void increment() {
    setState((){
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 30;

  @override
  Widget build(BuildContext context) {
    print('Build');

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/sorvete.jpg'),
              fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              isFull? 'Affollato' : 'Benvenuto!',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 120,
                      color: isFull ? Colors.red : Colors.white,
                    )
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: isEmpty? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(110, 110),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purpleAccent),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'A sinistra',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(110, 110),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purpleAccent),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Entrato',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

