// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'buttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalprice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("price", style: TextStyle(fontSize: 16))),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("$price \$", style: TextStyle(fontSize: 16)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Shipping", style: TextStyle(fontSize: 16))),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("$shipping \$", style: TextStyle(fontSize: 16)))
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Total Price",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$totalprice \$",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomButtonCart(
            textbutton: "Place Order",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
