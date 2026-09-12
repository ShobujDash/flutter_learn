import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: const Column(
        children: [
          // Calulator Display
          DisplayOne(hint: "Enter First Number"),
          SizedBox(height: 30.0),
          DisplayOne(hint: "Enter Second Number"),
          Spacer(),
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ],
          ),

          // Expand
          // Calculator Buttons
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne({super.key, this.hint});

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
