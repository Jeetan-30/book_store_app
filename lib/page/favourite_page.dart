import 'package:bookstore/Constant/constant_file.dart';
import 'package:bookstore/manager/manage_state.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';


class Favorite extends StatelessWidget {
  const Favorite ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            "Favorites",
            style: myStyle( 30,Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.white,size: 27
          ),
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.cardProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.29,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(19),bottomLeft: Radius.circular(19)),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${ms.cardProduct[index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.29,
                                  width: MediaQuery.of(context).size.width * 0.57,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${ms.cardProducts[index].bookName}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "${ms.cardProducts[index].authore}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "${ms.cardProducts[index].publishDate}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "\$${ms.cardProducts[index].price}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Gap(20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}