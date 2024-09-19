import 'package:bookstore/Constant/constant_file.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class PurchaseSuccessfull extends StatefulWidget {
  const PurchaseSuccessfull({super.key});

  @override
  State<PurchaseSuccessfull> createState() => _PurchaseSuccessfullState();
}

class _PurchaseSuccessfullState extends State<PurchaseSuccessfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase Successfull!", style: myStyle(29, Colors.white),),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan.withOpacity(0.6),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Lottie.asset('assets/animations/Animation - 1724223687578.json'),
        ),

      ),

    );
  }
}
