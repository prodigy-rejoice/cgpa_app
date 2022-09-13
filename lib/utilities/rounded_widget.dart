import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({Key? key, required this.gpaCounter, this.onPress})
      : super(key: key);

  final String gpaCounter;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: const BorderSide(
          width: 3,
          color: Colors.deepOrange,
        ),
      ),
      fillColor: Colors.deepOrange,
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      elevation: 1.0,
      child: Text(
        gpaCounter,
        style: const TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
