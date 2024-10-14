import 'package:flutter/material.dart';
import 'package:kushgold_web/const/imageAssert.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            ImageAssert.goldImage,
            fit: MediaQuery.of(context).size.width < 500 ?
            BoxFit.cover : BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 00, 10, 30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3)
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Text("Coming Soon....",style: Theme.of(context).textTheme.displaySmall!.apply(color: Colors.white)),
                )),
          )
        ],
      ),
    );
  }
}
