import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  String keyText;
  String valueText;
  DetailsText({
    required this.keyText,
    required this.valueText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        softWrap: false,
        maxLines: 2,
        overflow: TextOverflow.ellipsis, // new
        text: TextSpan(
            text: keyText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text:
                    valueText,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )
            ]),
      ),
    );
  }
}