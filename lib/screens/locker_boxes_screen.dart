///Created by Godslove Lee 24.07.2023
///Lasted Edited by Godslove 25.07.2023

import 'dart:async';
import 'package:flutter/material.dart';

import '../model/enums/pickup_boxes_enum.dart';
import '../widgets/count_down_widget.dart';

class LockerBoxes extends StatefulWidget {
  final List cartItems;
  final int orderId;

  const LockerBoxes({
    Key? key,
    required this.cartItems,
    required this.orderId,
  }) : super(key: key);

  @override
  State<LockerBoxes> createState() => _LockerBoxesState();
}

class _LockerBoxesState extends State<LockerBoxes> {
  //Flag to display/un-display the order ID when the timer starts
  late final HereIsYourPickUp hereIsYourPickUp = HereIsYourPickUp.displayPickUpAvailable;

  bool _showOrderId = true;
  bool _showPickUpBoxText = true;
  bool _showOrderImage = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer(Duration(minutes: 1), () {
      setState(() {
        _showOrderId = false;
        _showPickUpBoxText = false;
        _showOrderImage = false;
      });
    });
  }

  String _showHereIsPickUp(){
    switch(hereIsYourPickUp){

      case HereIsYourPickUp.displayPickUpAvailable:
        return 'Here is your Available PickUp Box';
      case HereIsYourPickUp.displayPickUpNotAvailable:
        return 'Please Select New Order';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC9D4DA),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFC9D4DA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  _showPickUpBoxText
                      ? _showHereIsPickUp()
                      : "Please Select a New Order",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 8, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                ),
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  return LockerBoxesItem(
                    boxIndex: index,
                    item: widget.cartItems[index],
                    orderId: widget.orderId,
                    showOrderId: _showOrderId,
                    showOrderImage:
                        _showOrderImage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _showOrderId
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: CountdownWidget(
                initialTime: 1 * 60, // 5 minutes in seconds
                onTimerFinished: () {
                  setState(() {
                    _showOrderId = false;
                  });
                },
              ),
            )
          : null,
    );
  }
}

class LockerBoxesItem extends StatelessWidget {
  final int boxIndex;
  final List item;
  final int orderId;
  final bool showOrderId;
  final bool showOrderImage;
  // Receive the flag from the parent widget

  LockerBoxesItem({
    required this.boxIndex,
    required this.item,
    required this.orderId,
    required this.showOrderId,
    required this.showOrderImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(children: [
        Center(
          child: showOrderId // Use the flag received from the parent widget
              ? Text(
                  'Order ID: #${orderId}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                )
              : SizedBox.shrink(), // Use SizedBox.shrink() to hide the widget
        ),
        Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), // Set the inner box color to white
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(4),
            ),
            child: showOrderImage
                ? Image.asset('lib/assets/pickupbox.png')
                : SizedBox.shrink()),
      ]),
    );
  }
}
