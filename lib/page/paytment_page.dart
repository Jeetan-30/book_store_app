import 'package:bookstore/Constant/constant_file.dart';
import 'package:bookstore/data/address_data.dart';
import 'package:bookstore/data/payment_data.dart';
import 'package:bookstore/manager/manage_state.dart';
import 'package:bookstore/model/payment_model.dart';
import 'package:bookstore/page/purchase_success.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentModel _selectedMethod = allMethods[0];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _showCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Payment Information",
          style: myStyle(29, Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 27),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Name: ${customer[0].name}',
                  style: myStyle(25, Colors.black),
                ),
                Text(
                  'Email: ${customer[0].email}',
                  style: myStyle(25, Colors.black),
                ),
                Text(
                  'Contact: ${customer[0].phoneNo}',
                  style: myStyle(25, Colors.black),
                ),
                Text(
                  'Address: ${customer[0].address}',
                  style: myStyle(25, Colors.black),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            //height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Number of Books:  ${ms.cardProducts.length}",
                                  style:
                                  myStyle(25, Colors.black),
                                ),
                                Text(
                                  "Total Price:  \$ ${ms.calculate()}",
                                  style:
                                  myStyle(25, Colors.black),
                                ),
                                Gap(20),
                                Text(
                                  "Payment Option",
                                  style: myStyle(25, Colors.black),
                                ),
                                Gap(10),
                                Card(
                                  elevation: 4,
                                  child: DropdownButton<PaymentModel>(
                                    value: _selectedMethod,
                                    onChanged: (PaymentModel? newValue) {
                                      setState(() {
                                        _selectedMethod = newValue!;
                                        _showCardDetails =
                                            _selectedMethod != allMethods[0];
                                      });
                                    },
                                    items: allMethods
                                        .map<DropdownMenuItem<PaymentModel>>(
                                      (PaymentModel method) {
                                        return DropdownMenuItem<PaymentModel>(
                                          value: method,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "${method.imgUrl}"),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Gap(10),
                                              Text("${method.paymentMethod}"),
                                            ],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _cardNumber,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Card number',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _amount,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _password,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(20),
                                MaterialButton(
                                  height: 45,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  color: Color(0xff00b4d8),
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PurchaseSuccessfull()));
                                  },
                                  child: Text(
                                    "Buy Now",
                                    style: myStyle(20, Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
