import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Calulator Display
          CalculatorDisplay(
            hint: "Enter First Number",
            controller: displayOneController,
          ),
          SizedBox(height: 30.0),
          CalculatorDisplay(
            hint: "Enter Second Number",
            controller: displayTwoController,
          ),
          SizedBox(height: 30.0),
          Text(
            z.toString(),
            style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  z =
                      num.tryParse(displayOneController.text)! +
                      num.tryParse(displayTwoController.text)!;
                  setState(() {});
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  z =
                      num.tryParse(displayOneController.text)! -
                      num.tryParse(displayTwoController.text)!;
                  setState(() {});
                },
                child: Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z =
                        num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  z =
                      num.tryParse(displayOneController.text)! /
                      num.tryParse(displayTwoController.text)!;
                  setState(() {});
                },
                child: Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                displayOneController.clear();
                displayTwoController.clear();
                z = 0;
              });
            },
            label: const Text("Clear"),
          ),

          // Expand
          // Calculator Buttons
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({super.key, this.hint, required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),

        hintText: hint,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
