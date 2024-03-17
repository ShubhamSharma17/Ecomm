import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
        backgroundColor: AppConstant.appStatusBarColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Card(
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(radius: 14),
              title: Text("Title here.."),
              subtitle: Row(
                children: [
                  Text("Rs 2222"),
                  SizedBox(width: 20),
                  CircleAvatar(
                    child: Text("+", style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    child: Text("-", style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 10),
              const Text(
                "Rs 3926",
                style: TextStyle(fontSize: 18),
              ),
              CupertinoButton(
                color: AppConstant.appSecondryColor,
                child: const Text("CheckOut"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
