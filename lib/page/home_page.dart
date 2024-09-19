import 'package:bookstore/Constant/constant_file.dart';
import 'package:bookstore/data/product_data.dart';
import 'package:bookstore/manager/manage_state.dart';
import 'package:bookstore/page/book_details.dart';
import 'package:bookstore/page/card_page.dart';
import 'package:bookstore/page/favourite_page.dart';
import 'package:bookstore/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context, ms, _) {
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingPages()));
                        },
                        leading: Icon(
                          Icons.settings_outlined,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "Settings",
                          style: myStyle(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.key_outlined,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "Account",
                          style: myStyle(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "Privacy",
                          style: myStyle(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications_active_outlined,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "Notifications",
                          style: myStyle(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.language_outlined,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "App Language",
                          style: myStyle(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.sd_storage_outlined,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "Storage and Data",
                          style: myStyle(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person_add_alt_1_outlined,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "Invite a Friend",
                          style: myStyle(20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.question_answer_outlined,
                          size: 25,color: Colors.blue,
                        ),
                        title: Text(
                          "Help and Feedback",
                          style: myStyle(20),
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlertDialog(
                                title: Text("Do you want to Log Out?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Yes",
                                        style: myStyle(19),
                                      )),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: myStyle(19),
                                      ))
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 25,color: Colors.blue,
                    ),
                    title: Text(
                      "Log Out",
                      style: myStyle(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor:Colors.cyan,
            iconTheme: IconThemeData(
                color: Colors.white,size: 30
            ),
            actions: [
              Icon(Icons.search, size: 30, color: Colors.white),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => Favorite()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 30, color: Colors.white,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${ms.bookmarkCounter}",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => CartPage()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 30, color: Colors.white,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${ms.counter}",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Top Rated Books",
                    style: myStyle(29, Colors.black, FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: store.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>BookDetails(bookList: store[index],)));
                          },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  height: 171,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("${store[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gap(10),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("${store[index].bookName}",style: myStyle(20),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$ ${store[index].price}",
                                            style: myStyle(25),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  bool added = ms.addToBookmark(store[index]);
                                                  String message = added
                                                      ? "Book has been added"
                                                      : "Book has been removed";
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      duration: Duration(seconds: 2),
                                                      content: Text(message),
                                                    ),
                                                  );
                                                },
                                                icon: store[index].Bookmarked ?Icon(
                                                  Icons.favorite_border_outlined,
                                                  size: 30, color: Colors.red,
                                                ): Icon(
                                                  Icons.favorite_border_outlined,
                                                  size: 30, color: Colors.blue,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  bool added = ms.addToCard(store[index]);
                                                  String message = added
                                                      ? "Book has been added"
                                                      : "Book has been removed";
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      duration: Duration(seconds: 2),
                                                      content: Text(message),
                                                    ),
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.shopping_cart_outlined,
                                                  size: 30, color: Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
